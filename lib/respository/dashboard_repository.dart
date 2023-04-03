import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '/model/dashboard.dart';
import '/res/app_url.dart';

class DashboardRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<DashboardListModel> fetchDashboardList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.dashboardListEndPoint);
      return response = DashboardListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
