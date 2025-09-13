import 'package:apple_market/di/di.dart';
import 'package:apple_market/exeption/api_exeption.dart';
import 'package:apple_market/model/gallery.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailDataSource {
  Future<List<Gallery>> getItemGallery();
}

class ProductDetailRemoteDataSource extends IProductDetailDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Gallery>> getItemGallery() async {
    try {
      var responseGalleryItem = await _dio.get('collections/gallery/records');
      return responseGalleryItem
          .data['items'] // تبدیل کردن مقادیر گرفته شده از سرور و جاگذاری
          .map<Gallery>((jsonObject) => Gallery.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response!.statusCode, ex.message);
    } catch (ex) {
      throw ApiException(0, 'خطا نامشخص');
    }
  }
}
