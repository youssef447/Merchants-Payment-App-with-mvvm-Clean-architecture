import 'package:dio/dio.dart';

class DioHelper {
  static late Dio  dio;
  static init({required String baseUrl}) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        
        receiveDataWhenStatusError: true,
        
      ),
      
    );
  }

  static Future<Response> getData({
    required String method,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio.get(method, queryParameters: query);
  }

  static Future<Response> postData({
    required String method,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return await dio.post(
      method,
      queryParameters: query,
      data: data,
    );
  }
}
