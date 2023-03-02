import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '/data/app_excaptions.dart';
import '/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url), headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },).timeout(const Duration(seconds: 120));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

    @override
  Future getPostApiResponse(
    String url,
    dynamic data,
  ) async {
    dynamic responseJson;
    try {
      Map<String, String> headerData = {"Content-Type": "application/json"};
      Response response = await post(
        Uri.parse(url),
        headers: headerData,
        body: jsonEncode(data),
      ).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }



  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
