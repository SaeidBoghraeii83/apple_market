import 'package:apple_market/model/gallery.dart';
import 'package:dartz/dartz.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductResponseState extends ProductState {
  Either<String, List<Gallery>> getGallery;
  ProductResponseState(this.getGallery);
}
