import '/data/network/BaseApiServices.dart';
import '/data/network/NetworkApiService.dart';
import '/model/dashboard.dart';
import '/res/app_url.dart';

class DashboardRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<DashboardListModel> fetchDashboardList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.dashboardListEndPoint);
      return response = DashboardListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
