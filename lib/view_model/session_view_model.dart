import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../respository/session_repository.dart';
import '../utils/utils.dart';
import '../view/batch_listing/batchlist_search.dart';


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
      /// navigate for next page
          Navigator.pop(context);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (BuildContext context) =>
      //     const SearchBatchList(),
      //   ),
      // );
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }


}
