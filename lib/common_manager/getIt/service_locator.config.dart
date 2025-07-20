// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:proj/common_manager/cart_bloc/cart_bloc.dart' as _i386;
import 'package:proj/common_manager/getIt/injection_module.dart' as _i344;
import 'package:proj/common_manager/quantity_bloc/quantity_bloc.dart' as _i419;
import 'package:proj/data/models/product_model.dart' as _i579;
import 'package:proj/data/services/product_service.dart' as _i910;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i419.QuantityBloc>(() => _i419.QuantityBloc());
    gh.lazySingleton<_i910.ProductService>(() => _i910.ProductService());
    gh.lazySingleton<List<_i579.ProductModel>>(
      () => injectionModule.allProducts,
      instanceName: 'allProducts',
    );
    gh.factory<_i386.CartBloc>(() => _i386.CartBloc(
        gh<List<_i579.ProductModel>>(instanceName: 'allProducts')));
    return this;
  }
}

class _$InjectionModule extends _i344.InjectionModule {}
