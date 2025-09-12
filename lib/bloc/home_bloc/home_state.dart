import 'package:apple_market/model/banner.dart';
import 'package:apple_market/model/category.dart';
import 'package:apple_market/model/product.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<Baner>> responseBaner;
  Either<String, List<Category>> responseCategory;
  Either<String, List<Product>> responseProduct;
  Either<String, List<Product>> responseProductBestSeller;
  Either<String, List<Product>> responseProductHotest;

  HomeResponseState(
    this.responseBaner,
    this.responseCategory,
    this.responseProduct,
    this.responseProductBestSeller,
    this.responseProductHotest,
  );
}
