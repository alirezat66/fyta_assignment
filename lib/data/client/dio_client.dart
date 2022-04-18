import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FytaApi with DioMixin implements Dio {
  FytaApi() {
    options = BaseOptions(
      baseUrl: _baseUrl(),
      contentType: 'multipart/form-data',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );
    httpClientAdapter = DefaultHttpClientAdapter();
  }
  Future<Response> postFileAsync(String endPoint, File file) async {
    String base = '${_baseUrl()}$endPoint?api-key=${_getKey()}';

    debugPrint(base);
    FormData data = FormData.fromMap({
      "images": [
        await MultipartFile.fromFile(file.path, filename: 'image.jpg')
      ],
    });

    var response = await post(base, data: data);
    debugPrint(response.statusCode.toString());
    return response;
  }

  _baseUrl() {
    String baseUrl = dotenv.env['baseurl'] as String;
    return baseUrl;
  }

  _getKey() {
    String key = dotenv.env['key'] as String;
    return key;
  }
}
