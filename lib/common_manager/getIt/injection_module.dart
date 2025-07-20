import 'package:injectable/injectable.dart';
import 'package:proj/common_ui/product_data.dart';
import 'package:proj/data/models/product_model.dart';
import '../../common_ui/products.dart';

@module
abstract class InjectionModule{
  @lazySingleton
  @Named('allProducts')
  List <ProductModel> get allProducts =>[];
}