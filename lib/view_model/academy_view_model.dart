import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../model/Edit_academy_model.dart';
import '../model/Qr_model.dart';
import '../model/academy_model.dart';
import '../utils/utils.dart';
import '../view/academy/academy_details.dart';

import '../view/academy/academy_setting.dart';
import '/data/response/api_response.dart';
import '/respository/academy_repository.dart';
class AcademyViewViewModel with ChangeNotifier {

  final _myRepo = AcademyRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  ApiResponse<AcademyListModel> dataList = ApiResponse.loading();
  ApiResponse<EditAcademyListModel> dataList1 = ApiResponse.loading();
  ApiResponse<QrModel> dataList2 = ApiResponse.loading();
  String filename = '';
  setDataList(ApiResponse<AcademyListModel> response){
    dataList = response ;
    notifyListeners();
  }
  setDataList1(ApiResponse<EditAcademyListModel> response){
    dataList1 = response ;
    notifyListeners();
  }
  setDataList2(ApiResponse<QrModel> response){
    dataList2 = response ;
    notifyListeners();
  }
  Future<void> fetchAcademyListApi ()async{
    setDataList(ApiResponse.loading());

    _myRepo.fetchAcademyListApi().then((value){
         print(value);
         print("fetch academy list success");
      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      print("error is $error");
      print("fetch academy list not success");
      setDataList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> fetchEditAcademy(dynamic data, String path)async{
    setDataList1(ApiResponse.loading());

    _myRepo.fetchEditAcademyListApi(data).then((value){
      print("academy edit details api success");
      setDataList1(ApiResponse.completed(value));
      print("path$path");
      Get.back(result: "success");
      //Get.to(()=> academy_setting( pathofpage: path,),transition: Transition.rightToLeft);


    }).onError((error, stackTrace){
      print("academy edit details api not success");
      setDataList1(ApiResponse.error(error.toString()));
    });
  }

  Future<bool> fetchouserProfileimg(data, context) async {
    _myRepo.fetchouserProfileimg(data).then((value) async {
      // Utils.flushBarErrorMessage(value['msg'], context);
    }).onError((error, stackTrace) {
      setLoading(false);
      print("api  not success for image ");
    });
    return true;
  }

  Future<bool> fetchouserQrimg(data, context) async {
    _myRepo.uploadQr(data).then((value) async {
      print("fetchouserQrimg api success");
      filename = value.filename;
      setDataList2(ApiResponse.completed(value));
    //   Utils.flushBarErrorMessage(value['msg'], context);
    }).onError((error, stackTrace) {
      setLoading(false);
      print("error is $error");
      print("api  not success for image ");
    });
    return true;
  }


}
