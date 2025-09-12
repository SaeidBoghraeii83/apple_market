import 'package:apple_market/bloc/home_bloc/home_event.dart';
import 'package:apple_market/bloc/home_bloc/home_state.dart';
import 'package:apple_market/di/di.dart';
import 'package:apple_market/repository/banner_repository.dart';
import 'package:apple_market/repository/category_repository.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<BannerEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();

  final ICategoryRepository _categoryRepository = locator.get();
  //final IProductRepository _productRepository = locator.get();

  HomeBloc() : super(HomeInitState()) {
    on<RequestHomeEvent>((event, emit) async {
      emit(HomeLoadingState());
      var responseBaner = await _bannerRepository.getBannerData();
      var responseCategory = await _categoryRepository.getCategoryData();
      //var responseProduct = await _productRepository.getDataProduct();
      // var responseProductBestSeller = await _productRepository
      //   .getDataProductBestSeller();
      // var responseProductHotest = await _productRepository
      //    .getDataProductHotest();

      emit(
        HomeResponseState(
          responseBaner,
          responseCategory,
          //   responseProduct,
          //    responseProductBestSeller,
          //   responseProductHotest,
        ),
      );
    });
  }
}
