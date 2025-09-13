import 'package:apple_market/bloc/category_bloc/category_event.dart';
import 'package:apple_market/bloc/category_bloc/category_state.dart';
import 'package:apple_market/di/di.dart';
import 'package:apple_market/repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _categoryRepository = locator.get();
  CategoryBloc() : super(CategoryInitState()) {
    on<RequestCategoryItem>((event, emit) async {
      emit(CategoryLoadingState());
      var responseCategory = await _categoryRepository.getCategoryData();
      emit(CategoryResponseState(responseCategory));
    });
  }
}
