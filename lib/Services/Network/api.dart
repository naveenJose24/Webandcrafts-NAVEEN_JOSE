import 'dart:async';

import 'package:dio/dio.dart';

import '../../Utils/Constants/text_constants.dart';
import '../../Utils/Widgets/common.dart';
import 'network_exception.dart';

class ApiProvider {
  Dio _dio = Dio();
  ApiProvider() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 5000,
        connectTimeout: 5000,
        baseUrl: BASE_URL,
        contentType: "application/json");

    _dio = Dio(options);
    _dio.interceptors.clear();
    _dio.interceptors.add(interceptorsWrapper);
  }

  InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(onRequest:
      (RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }, onResponse: (Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response); // continue
  }, onError: (DioError error, ErrorInterceptorHandler handler) async {
    if (error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.other) {
      return handler.next(error);
    }
    print("------------------------------------------------");
    print(error.response!.requestOptions.path);
    print('statusCode:--${error.response!.statusCode}');
    print('statusCode:--${error.response!.data['message']}');
    print("------------------------------------------------");

    switch (error.response!.statusCode) {
      case 400:
        showFlutterToast(error.response!.data['message']);
        return handler.next(error);
      case 410:
        return handler.next(error);
      case 413:
        showFlutterToast(error.response!.data['message']);
        throw BadRequestException(error.response!.data.toString());
      case 402:
        showFlutterToast(error.response!.data['message']);
        return handler.next(error);
      case 401:
        throw UnauthorisedException((error.response!.data.toString()));
      case 403:
        showFlutterToast(error.response!.data['message']);
        return handler.next(error);
      case 404:
        return handler.next(error);
      case 500:
        throw FetchDataException(error.response!.data.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${error.response!.statusCode}');
    }
  });

  /// *********************GET REQUEST********************************

  Future<dynamic> get(String url) async {
    print(url);
    try {
      final response = await _dio.get(url);
      print("-----------------------API RESPONSES---------------------------------------");
      print(response);
      return response.data;
    } on DioError catch (e){
      print("-----------------------DioError---------------------------------------");
      print(e);
    }
  }


}
