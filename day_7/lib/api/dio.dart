import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio dio = Dio();

  DioClient() {
    dio.options.baseUrl = 'https://api.restful-api.dev';
    dio.options.receiveDataWhenStatusError = true;
    dio.interceptors.add(PrettyDioLogger());
  }
  //  dio.get('projects')
  // 'https://api.example.com/projects'
  Future<Response> get(String path) {
    return dio.get(path);
  }

  Future<Response> post(String path, dynamic data) {
    return dio.post(path, data: data);
  }
}
