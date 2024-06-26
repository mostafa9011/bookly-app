import 'package:bookly/core/constants.dart';
import 'package:dio/dio.dart';

//go to comments...

class ApiService {
  final Dio _dio;

  // declare your baseUrl
  static const String baseUrl = Constants.baseUrl;

  ApiService(this._dio);

  //get method.
  Future<Map<String, dynamic>> get({
    required String endPoint,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
          //Content-Type , Accept have a value by default..
        },
      );
    }

    Response response = await _dio.get(
      '$baseUrl$endPoint',
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }

  //post method.
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic data,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
          //Content-Type , Accept have a value by default..
        },
      );
    }

    Response response = await _dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }

  //update methodز
  Future<Map<String, dynamic>> update({
    required String endPoint,
    required dynamic data,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
          //Content-Type , Accept have a value by default..
        },
      );
    }

    Response response = await _dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }
}
