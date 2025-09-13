import 'package:apple_market/data/datasource/banner_data_source.dart';
import 'package:apple_market/data/datasource/category_data_source.dart';
import 'package:apple_market/data/datasource/product_data_source.dart';
import 'package:apple_market/data/datasource/product_detail_data_source.dart';
import 'package:apple_market/repository/banner_repository.dart';
import 'package:apple_market/repository/category_repository.dart';
import 'package:apple_market/repository/product_detail_repository.dart';
import 'package:apple_market/repository/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(BaseOptions(baseUrl: 'http://startflutter.ir/api/')), // بیس یو آر ال
  ); // ریکوست بزن به این );

  // datasource
  locator.registerFactory<IBannerDataSource>(() => BannerRemoteDataSource());
  locator.registerFactory<ICategoryDataSource>(
    () => CategoryRemoteDataSource(),
  );
  locator.registerFactory<IProductDataSource>(() => ProductRemoteDataSource());
  locator.registerFactory<IProductDetailDataSource>(
    () => ProductDetailRemoteDataSource(),
  );

  // repository
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IProductRepository>(() => ProductRemoteRepository());
  locator.registerFactory<IProductDetailRepository>(
    () => ProductDetailRepository(),
  );
}
