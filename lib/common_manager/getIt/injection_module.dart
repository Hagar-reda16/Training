import 'package:injectable/injectable.dart';
import 'package:proj/common_ui/product_data.dart';
import '../../common_ui/products.dart';

@module
abstract class InjectionModule{
  @lazySingleton
  List <Product> get allProducts =>products;
}