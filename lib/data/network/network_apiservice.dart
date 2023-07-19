import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import '/data/app_excaptions.dart';

import 'base_apiservices.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future uploadImageHTTP(
    url,
    dynamic file,
  ) async {
    dynamic responseJson;
    try {
      final prefsToken = await SharedPreferences.getInstance();
      dynamic token = prefsToken.getString('token');
      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'token': token,
      };
      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('image', file,
            contentType: MediaType("image", "jpeg")));
      var response = await request.send();

      if (response.statusCode == 200) {
        responseJson = await response.stream.bytesToString();
      } else {
        throw UnauthorisedException(jsonEncode({"msg": "File upload error"}));
      }
    } on SocketException {
      throw FetchDataException('API Connection Error');
    }
    return jsonDecode(responseJson);
  }

  Future uploadImageHTTP2(
      url,
      dynamic file,
      ) async {
    dynamic responseJson;
    try {
      final prefsToken = await SharedPreferences.getInstance();
      dynamic token = prefsToken.getString('token');
      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'token': token,
      };
      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('file', file,
           // contentType: MediaType("file", "jpeg")
            ));
      var response = await request.send();

      if (response.statusCode == 200) {
        responseJson = await response.stream.bytesToString();
      } else {
        throw UnauthorisedException(jsonEncode({"msg": "File upload error"}));
      }
    } on SocketException {
      throw FetchDataException('API Connection Error');
    }
    return jsonDecode(responseJson);
  }

  @override
  Future getGetApiResponse(String url) async {
    final prefsToken = await SharedPreferences.getInstance();
    dynamic token = prefsToken.getString('token');
    dynamic responseJson;
    try {
      if (kDebugMode) {
        print(url);
      }
      final response = await http.get(Uri.parse(url), headers: {
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

  @override
  Future getPutApiResponseWithData(
    String url,
    dynamic data,
  ) async {
    final prefsToken = await SharedPreferences.getInstance();
    dynamic token = prefsToken.getString('token');
    dynamic responseJson;
    try {
      if (kDebugMode) {
        print("toekn is $token");
        print(url);
      }
      Map<String, String> headerData = {
        "Content-Type": "application/json",
        "token": token,
      };
      Response response = await put(
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



  ///getPutApiResponse
  @override
  Future getPutApiResponse(String url) async {
    final prefsToken = await SharedPreferences.getInstance();
    dynamic token = prefsToken.getString('token');
    dynamic responseJson;
    try {
      if (kDebugMode) {
        print(url);
      }
      final response = await http.put(Uri.parse(url), headers: {
        "token": token,
        "Content-Type": "application/json",
      }).timeout(const Duration(seconds: 120));
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
      case 200:
        {
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
