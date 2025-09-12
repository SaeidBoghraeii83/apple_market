import 'package:apple_market/di/di.dart';
import 'package:apple_market/exeption/api_exeption.dart';
import 'package:apple_market/model/banner.dart';
import 'package:dio/dio.dart';

abstract class IBannerDataSource {
  Future<List<Baner>> getBaner();
}

class BannerRemoteDataSource extends IBannerDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<Baner>> getBaner() async {
    try {
      var responseBaner = await _dio.get('collections/banner/records');
      return responseBaner
          .data['items'] // تبدیل کردن مقادیر گرفته شده از سرور و جاگذاری
          .map<Baner>((jsonObject) => Baner.formMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response!.statusCode, ex.message);
    } catch (ex) {
      throw ApiException(0, 'خطا نامشخص');
    }
  }
}
