import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import '/data/app_excaptions.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

import 'base_apiservices.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    final prefsToken = await SharedPreferences.getInstance();
    dynamic token = prefsToken.getString('token');
    dynamic responseJson;
    try {
      if (kDebugMode) {
        print(url);
      }
      final response =
          await http.get(Uri.parse(url), headers: {
             "token": token,
             "Content-Type": "application/json",
        
          }).timeout(const Duration(seconds: 120));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('API Connection Error');
    }
    return responseJson;
  }

  

    @override
  Future getPostApiResponse(
    String url,
    dynamic data,
  ) async {
    final prefsToken = await SharedPreferences.getInstance();
    dynamic token = prefsToken.getString('token');
    dynamic responseJson;
    try {
       if (kDebugMode) {
         print(url);
       }
      Map<String, String> headerData = {
        "Content-Type": "application/json",
         "token": token,
        };
      Response response = await post(
        Uri.parse(url),
        headers: headerData,
        body: jsonEncode(data),
      ).timeout(const Duration(seconds: 120));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('API Connection Error');
    }

    return responseJson;
  }

  //getstarted
  @override
  Future getPostWithoutApiResponse(
    String url,
    dynamic data,
  ) async {
    dynamic responseJson;
    try {
      Map<String, String> headerData = {
        "Content-Type": "application/json",
        };
      Response response = await post(
        Uri.parse(url),
        headers: headerData,
        body: jsonEncode(data),
      ).timeout(const Duration(seconds: 120));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('API Connection Error');
    }

    return responseJson;
  }


  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:{
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      }
      case 400:
        throw BadRequestException(jsonDecode(response.body)['msg']);
      case 500:
         throw BadRequestException(jsonDecode(response.body)['msg']);
      case 404:
       throw UnauthorisedException(jsonDecode(response.body)['msg']);
      default:
        throw FetchDataException(
            'Error accured while communicating with server with status code ${response.statusCode}');
    }
  }
}
