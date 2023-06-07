import 'package:drona/model/trainee_list_model.dart';

import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class TraineeRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  //trainee add
  Future<dynamic> fetchCreateTraineeListApi(data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.traineeAddinBatchEndpoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

// trainee fetch list
  Future<TraineeListModel> fetchTraineelistListApi() async {
    try {

      dynamic response = await _apiServices
          .getPutApiResponse(AppUrl.traineeListinBatchEndpoint);
      return response = TraineeListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<TraineeListModel> fetchTraineeListSearchApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPutApiResponseWithData(
          AppUrl.traineeListinBatchEndpoint, data);
      return response = TraineeListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
