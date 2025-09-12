import 'package:apple_market/data/datasource/product_data_source.dart';
import 'package:apple_market/di/di.dart';
import 'package:apple_market/exeption/api_exeption.dart';
import 'package:apple_market/model/product.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> getDataProduct();
  Future<Either<String, List<Product>>> getDataProductBestSeller();
  Future<Either<String, List<Product>>> getDataProductHotest();
}

class ProductRemoteRepository extends IProductRepository {
  final IProductDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Product>>> getDataProduct() async {
    try {
      var responseProduct = await _dataSource.getProduct();
      return right(responseProduct);
    } on DioError catch (ex) {
      return left(ApiException(ex.response!.statusCode, ex.message).toString());
    } catch (ex) {
      return left(ApiException(0, 'خطا نامشخص').toString());
    }
  }

  @override
  Future<Either<String, List<Product>>> getDataProductBestSeller() async {
    try {
      var responseProduct = await _dataSource.getProductBestSeller();
      return right(responseProduct);
    } on DioError catch (ex) {
      return left(ApiException(ex.response!.statusCode, ex.message).toString());
    } catch (ex) {
      return left(ApiException(0, 'خطا نامشخص').toString());
    }
  }

  @override
  Future<Either<String, List<Product>>> getDataProductHotest() async {
    try {
      var responseProduct = await _dataSource.getProductHotest();
      return right(responseProduct);
    } on DioError catch (ex) {
      return left(ApiException(ex.response!.statusCode, ex.message).toString());
    } catch (ex) {
      return left(ApiException(0, 'خطا نامشخص').toString());
    }
  }
}
