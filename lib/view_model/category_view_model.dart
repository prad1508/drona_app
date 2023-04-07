

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../model/category_model.dart';
import '/data/response/api_response.dart';
import '/respository/category_repository.dart';
class CategoryViewViewModel with ChangeNotifier {

  final _myRepo = CategoryRepository();

  ApiResponse<CategoryListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<CategoryListModel> response){
    dataList = response ;
    notifyListeners();
  }
  Future<void> fetchCategoryListApi ()async{
    setDataList(ApiResponse.loading());
    _myRepo.fetchCategoryListApi().then((value){
      setDataList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}
