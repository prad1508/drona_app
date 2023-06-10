import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/response/api_response.dart';
import '../model/sessionList_model.dart';
import '../respository/session_repository.dart';
import '../utils/utils.dart';
import '../view/batch_listing/batchlist_search.dart';
import '../view/session_listing/session_list.dart';


class SessionViewViewModel with ChangeNotifier {

  final _myRepo = SessionRepository();
  bool _loading = false ;
  bool get loading => _loading ;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> fetchCreateSessionListApi (dynamic data, BuildContext context)async{
    setLoading(true);
    _myRepo.fetchCreateSessionListApi(data).then((value){
      setLoading(false);
      Utils.flushBarErrorMessage(value['msg'], context);
      print("scuessfullydvbghn");
      /// navigate for next page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
          const SessionList(),
        ),
      );
    }).onError((error, stackTrace){
      print("error msg is");
      print(error.toString());
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  ApiResponse<SessionListListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<SessionListListModel> response) {
    dataList = response;
    notifyListeners();
  }

  Future<void> fetchSessionListSearchApi(dynamic data) async {
    setDataList(ApiResponse.loading());

    _myRepo.fetchSessionListSearchApi(data).then((value) {
      setDataList(ApiResponse.completed(value));

      print("api session serach list success");
    }).onError((error, stackTrace) {
      setDataList(ApiResponse.error(error.toString()));
      print("api  session search list not success");
      print("error${ApiResponse.error(error.toString())}");
    });
  }

  Future<void> fetchSessionDetailsListhApi(String? id) async {
    setDataList(ApiResponse.loading());

    _myRepo.fetchSessionDetailsListApi(id).then((value) {
      setDataList(ApiResponse.completed(value));

      print("api session Details list success");
    }).onError((error, stackTrace) {
      setDataList(ApiResponse.error(error.toString()));
      print("api  session Details list not success");
      print(error);
      print("error${ApiResponse.error(error.toString())}");
    });
  }


}
