
import 'package:flutter/material.dart';
import 'package:proj/products.dart';
import 'package:proj/product_data.dart';

class ProductProvider with ChangeNotifier{
  List<Product> _productsList =[];
  bool _isLoading =true;

  List<Product> get getProducts  => _productsList;
  bool get isLoading => _isLoading;

  ProductProvider() {
    loadProducts();
  }


  Future<void> loadProducts() async{
   await Future.delayed(Duration(seconds: 2));
   _productsList =products;
   _isLoading=false;
   notifyListeners();
  }
  void addProduct(Product newProduct){
    _productsList.add(newProduct);
     notifyListeners();
  }

}