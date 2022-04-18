import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FytaApi with DioMixin implements Dio {
  FytaApi(){
    options = BaseOptions(
      baseUrl: _baseUrl(),
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );
  }
Future<Response> postFileAsync(String endPoint, {File? file}) async {
    String base = _baseUrl();
    String fileName = file!.path.split('/').last;
    FormData data = FormData.fromMap({
      "images": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
    debugPrint("$base$endPoint");
    var response = await post(
      "$base$endPoint",
      data: data,
    );
    return response;
  }
  _baseUrl() {
    String baseUrl = dotenv.env['baseurl'] as String;
    return baseUrl;
  }
}