import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../view/batch_listing/batchlist_search.dart';
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
 // create batch
  Future<void> fetchCreatebatchListApi (dynamic data, BuildContext context)async{
    setLoading(true);
    _myRepo.fetchCreatebatchListApi(data).then((value){
       setLoading(false);
      Utils.flushBarErrorMessage(value['msg'], context);
      Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const SearchBatchList(),
                ),
              );
    }).onError((error, stackTrace){
       setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }


}
