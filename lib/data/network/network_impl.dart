import 'package:dio/dio.dart';

class Network {
  int _timeOut = 10000; //10s
  Dio _dio;

  Network() {
    BaseOptions options = BaseOptions(connectTimeout: _timeOut, receiveTimeout: _timeOut);
    Map<String, dynamic> headers = Map();
   /*
    Http request headers.
    headers["content-type"] = "application/json";
   */
    options.headers = headers;
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<Response> get({String url, Map<String, dynamic> params = const {}}) async {
    try {
      return await _dio.get(
        url,
        queryParameters: params,
        options: Options(responseType: ResponseType.json),
      );
    } on DioError catch (e) {
      //handle error
      print("DioError: ${e.toString()}");
    }
  }

  Future<Response> post({String url, Map<String, dynamic> body = const {}}) async {
    try {
      Response response = await _dio.post(
        url,
        data: body,
        options: Options(responseType: ResponseType.json),
      );
      return response;
    } on DioError catch (e) {
      //handle error
      print("DioError: ${e.toString()}");
    }
  }
}
