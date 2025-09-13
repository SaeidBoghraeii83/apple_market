import 'package:apple_market/data/datasource/product_data_source.dart';
import 'package:apple_market/data/datasource/product_detail_data_source.dart';
import 'package:apple_market/di/di.dart';
import 'package:apple_market/exeption/api_exeption.dart';
import 'package:apple_market/model/gallery.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailRepository {
  Future<Either<String, List<Gallery>>> getItemGallery();
}

class ProductDetailRepository extends IProductDetailRepository {
  final IProductDetailDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Gallery>>> getItemGallery() async {
    try {
      var responseGalleryItem = await _dataSource.getItemGallery();
      return right(responseGalleryItem);
    } on DioError catch (ex) {
      return left(ApiException(ex.response!.statusCode, ex.message).toString());
    } catch (ex) {
      return left(ApiException(0, 'خطا نامشخص').toString());
    }
  }
}
