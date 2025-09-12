import 'package:apple_market/bloc/home_bloc/category_bloc/category_bloc.dart';
import 'package:apple_market/bloc/home_bloc/category_bloc/category_event.dart';
import 'package:apple_market/bloc/home_bloc/category_bloc/category_state.dart';
import 'package:apple_market/model/category.dart';
import 'package:apple_market/widget/cashed_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(RequestCategoryItem());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              sliver: SliverToBoxAdapter(child: CategoryAppBar()),
            ),

            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 15.h),
                        Text(
                          'در حال ارتباط با سرور ',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is CategoryResponseState) {
                  return state.responseCategory.fold(
                    (error) {
                      return SliverToBoxAdapter(child: Text(error));
                    },
                    (responseList) {
                      return CategoryItem(listCategory: responseList);
                    },
                  );
                }
                return SliverToBoxAdapter(child: Text('خطا شد '));
              },
            ),
          ],
        ),
      ),
    );
  }
}

//====================================
class CategoryAppBar extends StatelessWidget {
  const CategoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Row(
          children: [
            Image.asset('images/icon_apple_blue.png'),
            SizedBox(width: 100.w),
            Text(
              textAlign: TextAlign.center,
              'دسته بندی',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'SM',
                fontWeight: FontWeight.bold,
                color: Colors.indigoAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//===========================

class CategoryItem extends StatelessWidget {
  final List<Category> listCategory;
  const CategoryItem({super.key, required this.listCategory});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: listCategory.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0.4,
        mainAxisSpacing: 5,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: CashedImage(
              imageUrl: listCategory[index].thumbnail!,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
