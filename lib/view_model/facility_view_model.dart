import 'package:drona/model/category_model.dart';
import 'package:drona/model/service_program_model.dart';
import 'package:drona/view/academy/service_program.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/facility_model.dart';
import '../model/myFacility_model.dart';
import '../utils/utils.dart';
import '../view/Academy_Listing/facility_program.dart';
import '/data/response/api_response.dart';
import '/respository/facility_repository.dart';

class FacilityViewViewModel with ChangeNotifier {
  int count = 0;
  int get getCount => count;

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  incrementCount() {
    count++;
    notifyListeners();
  }

  resetcounter() {
    count = 0;
    notifyListeners();
  }

  final _myRepo = FacilityRepository();

  ApiResponse<FacilityListModel> dataList = ApiResponse.loading();
  ApiResponse<MyFacilityListModel> dataList1 = ApiResponse.loading();
  setDataList(ApiResponse<FacilityListModel> response) {
    dataList = response;
    notifyListeners();
  }

  setDataList1(ApiResponse<MyFacilityListModel> response) {
    dataList1 = response;
    notifyListeners();
  }

  Future<void> fetchFacilityListApi(Data,
      {bool? isEdit, List<Myfacility>? myFacility}) async {
    setDataList(ApiResponse.loading());
    _myRepo.fetchFacilityListApi(Data).then((value) {
      setDataList(ApiResponse.completed(value));
      // if(isEdit??false){
      //   setDataForFacillityEdit(myFacility!,ApiResponse.completed(value));
      // }
    }).onError((error, stackTrace) {
      setDataList(ApiResponse.error(error.toString()));
    });
  }

  List setDataForFacillityEdit(List<Myfacility> myFacility) {
    List selectedValue = [];
    late List selectedValue2;
    late List
        _surfaceisChecked; //list of selcted item in Surface [true,false,false]
    late List _otherChecked; //list of selected item in others
    late List otherselectedlist;
    late List surfaceselectedlist;
    //allow number of fields
    late int? _surfaceisLength = 20;
    late int? _otherLength = 20;
    _surfaceisChecked = List.filled(_surfaceisLength ?? 0, false);
    surfaceselectedlist = List.filled(_surfaceisLength ?? 0, false);
    selectedValue = List.filled(_surfaceisLength ?? 0, '0');
    _otherChecked = List.filled(_otherLength ?? 0, false);
    otherselectedlist = List.filled(_otherLength ?? 0, false);
    selectedValue2 = List.filled(_otherLength ?? 0, '0');
    for (var element in myFacility[0].checkboxwithselectoption) {
      print(dataList.data!.checkboxwithselectoption);
      for (int i = 0;
          i < dataList.data!.checkboxwithselectoption!.length;
          i++) {
        if (dataList.data!.checkboxwithselectoption![i] == (element.name)) {
          _surfaceisChecked[i] = true;
          surfaceselectedlist[i] = element.name;
          selectedValue[i] = element.quantity.toString() ?? '0';
        }
      }
    }
    myFacility[0].other.forEach((element) {
      for (int i = 0; i < dataList.data!.other!.length; i++) {
        if (dataList.data!.other![i] == (element.name)) {
          _otherChecked[i] = true;
          otherselectedlist[i] = element.name;
        }
      }
    });

    return [
      _surfaceisChecked,
      surfaceselectedlist,
      selectedValue,
      _otherChecked,
      otherselectedlist,
      selectedValue2
    ];
  }

  Future<void> fetchGetFacilityListApi(String serviceId) async {
    setDataList1(ApiResponse.loading());
    _myRepo.fetchGetFacilityListApi(serviceId).then((value) {
      setDataList1(ApiResponse.completed(value));
      print("success");
    }).onError((error, stackTrace) {
      print("not success");
      print(error);
      setDataList1(ApiResponse.error(error.toString()));
    });
  }


  // gallery images upload
  Future<bool> uploadGalleryImg(data, context, String serviceUid) async {
    setLoading(true);
    _myRepo.uploadGalleryImg(data,serviceUid).then((value) async {
      setLoading(false);
       Utils.flushBarErrorMessage(value['msg'], context);
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);

      setLoading(false);
      print("api  not success for image ");
    });
    return true;
  }

  // update single program

  Future<void> updateSingleProgramApi(data, BuildContext context, String serviceUid) async {
    setLoading(true);

    _myRepo.updateSingleProgramApi(data).then((value) {
      setLoading(true);
      Navigator.of(context).pop();
      Utils.toastMessage(value["msg"]);

      Get.to(() => ServiceListPage(path: 'program&facility'), transition: Transition.rightToLeft);
      print("updateSingleProgramApi ");

    }).onError((error, stackTrace) {
      Navigator.of(context).pop();
      Utils.toastMessage(error.toString());
      setLoading(true);
    });
  }




}
