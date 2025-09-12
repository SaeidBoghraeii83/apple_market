import 'package:apple_market/di/di.dart';
import 'package:apple_market/exeption/api_exeption.dart';
import 'package:apple_market/model/category.dart';
import 'package:dio/dio.dart';

abstract class ICategoryDataSource {
  Future<List<Category>> getCategory();
}

class CategoryRemoteDataSource extends ICategoryDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Category>> getCategory() async {
    try {
      var responseCategory = await _dio.get('collections/category/records');
      return responseCategory
          .data['items'] // تبدیل کردن مقادیر گرفته شده از سرور و جاگذاری
          .map<Category>((jsonObject) => Category.formMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response!.statusCode, ex.message);
    } catch (ex) {
      throw ApiException(0, 'خطا نامشخص');
    }
  }
}
