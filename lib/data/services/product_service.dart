import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/product_model.dart';
import '../../core/network/dio_client.dart';

class ProductService{
  final Dio _dio=DioClient.dio;

  Future<List<ProductModel>> fetchProducts() async{
    final response= await _dio.get('products');
    return (response.data as List)
        .map((json)=>ProductModel.fromJson(json))
        .toList();
  }

  Future<ProductModel> fetchProductDetails(int id) async{
    final response=await _dio.get('products/$id');
    return ProductModel.fromJson(response.data);
  }

}