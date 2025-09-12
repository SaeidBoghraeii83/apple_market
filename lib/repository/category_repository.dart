import 'package:apple_market/data/datasource/category_data_source.dart';
import 'package:apple_market/di/di.dart';
import 'package:apple_market/exeption/api_exeption.dart';
import 'package:apple_market/model/category.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategoryData();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Category>>> getCategoryData() async {
    try {
      var responseCategory = await _dataSource.getCategory();
      return right(responseCategory);
    } on DioError catch (ex) {
      return left(ApiException(ex.response!.statusCode, ex.message).toString());
    } catch (ex) {
      return left(ApiException(0, 'خطا نامشخص').toString());
    }
  }
}
