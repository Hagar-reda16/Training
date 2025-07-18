import 'package:dio/dio.dart';
class DioClient{

  static final Dio _dio=Dio(BaseOptions(
    baseUrl: "https://api.escuelajs.co/api/v1/",
    connectTimeout: Duration(seconds: 20),
    receiveTimeout: Duration(seconds: 20)
  ));

  static Dio get dio =>_dio;
}