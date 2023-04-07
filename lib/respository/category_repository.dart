
import '../data/network/base_apiservices.dart';
import '../model/category_model.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class CategoryRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<CategoryListModel> fetchCategoryListApi()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.categoryListEndPoint);
      return response = CategoryListModel.fromJson(response);
      
    }catch(e){
      rethrow ;
    }
  }

}
