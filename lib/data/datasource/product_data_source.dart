import 'package:apple_market/di/di.dart';
import 'package:apple_market/exeption/api_exeption.dart';
import 'package:apple_market/model/product.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSource {
  Future<List<Product>> getProduct();
  Future<List<Product>> getProductHotest();
  Future<List<Product>> getProductBestSeller();
}

class ProductRemoteDataSource extends IProductDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Product>> getProduct() async {
    try {
      var responseProduct = await _dio.get('collections/products/records');
      return responseProduct
          .data['items'] // تبدیل کردن مقادیر گرفته شده از سرور و جاگذاری
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response!.statusCode, ex.message);
    } catch (ex) {
      throw ApiException(0, 'خطا نامشخص');
    }
  }

  @override
  Future<List<Product>> getProductBestSeller() async {
    try {
      Map<String, String> qParams = {
        'filter': 'popularity="Best Seller"', // درست
      };
      var responseProduct = await _dio.get(
        'collections/products/records',
        queryParameters: qParams,
      );
      return responseProduct
          .data['items'] // تبدیل کردن مقادیر گرفته شده از سرور و جاگذاری
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response!.statusCode, ex.message);
    } catch (ex) {
      throw ApiException(0, 'خطا نامشخص');
    }
  }

  @override
  Future<List<Product>> getProductHotest() async {
    try {
      Map<String, String> qParams = {
        'filter': 'popularity="Hotest"', // درست
      };
      var responseProduct = await _dio.get(
        'collections/products/records',
        queryParameters: qParams,
      );
      return responseProduct
          .data['items'] // تبدیل کردن مقادیر گرفته شده از سرور و جاگذاری
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response!.statusCode, ex.message);
    } catch (ex) {
      throw ApiException(0, 'خطا نامشخص');
    }
  }
}
