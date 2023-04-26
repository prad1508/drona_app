

import 'package:flutter/cupertino.dart';
import '/data/response/api_response.dart';
import '/respository/batch_repository.dart';
class BatchViewViewModel with ChangeNotifier {

  final _myRepo = BatchRepository();
 bool _loading = false ;
  bool get loading => _loading ;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> fetchCreatebatchListApi (dynamic data)async{
    _myRepo.fetchCreatebatchListApi(data).then((value){
    }).onError((error, stackTrace){
    });
  }
}
