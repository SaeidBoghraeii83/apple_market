import 'package:apple_market/data/datasource/banner_data_source.dart';
import 'package:apple_market/di/di.dart';
import 'package:apple_market/exeption/api_exeption.dart';
import 'package:apple_market/model/banner.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class IBannerRepository {
  Future<Either<String, List<Baner>>> getBannerData();
}

class BannerRepository extends IBannerRepository {
  final IBannerDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Baner>>> getBannerData() async {
    try {
      var response = await _dataSource.getBaner();
      return right(response);
    } on DioError catch (ex) {
      return left(ApiException(ex.response!.statusCode, ex.message).toString());
    } catch (ex) {
      return left(ApiException(0, 'خطا نامشخص').toString());
    }
  }
}
