import 'package:apple_market/bloc/product_bloc/product_event.dart';
import 'package:apple_market/bloc/product_bloc/product_state.dart';
import 'package:apple_market/di/di.dart';
import 'package:apple_market/repository/product_detail_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductDetailRepository _detailRepository = locator.get();
  ProductBloc() : super(ProductInitState()) {
    on<RequestProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      var responseGallery = await _detailRepository.getItemGallery();
      emit(ProductResponseState(responseGallery));
    });
  }
}
