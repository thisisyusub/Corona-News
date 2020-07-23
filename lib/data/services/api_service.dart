import 'package:dio/dio.dart';

class ApiService {
  ApiService._internal() {
    dio = new Dio();
    dio.options
      ..baseUrl = 'http://covid19-az.herokuapp.com/api'
      ..contentType = 'application/json';
  }

  Dio dio;

  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }
}
