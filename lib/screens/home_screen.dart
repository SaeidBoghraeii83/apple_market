import 'package:apple_market/bloc/home_bloc/home_bloc.dart';
import 'package:apple_market/bloc/home_bloc/home_event.dart';
import 'package:apple_market/bloc/home_bloc/home_state.dart';
import 'package:apple_market/widget/banner_slider.dart';
import 'package:apple_market/widget/category_item.dart';
import 'package:apple_market/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(RequestHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.blueAccent),
                        SizedBox(height: 20.h),
                        Text(
                          'در حال ارتباط با سرور ',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),

                        Text(
                          '...لطفا منتظر بمانید',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is HomeResponseState) {
              return CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    sliver: SliverToBoxAdapter(child: SearchBox()),
                  ),
                  state.responseBaner.fold(
                    (error) {
                      return SliverToBoxAdapter(child: Text(error));
                    },
                    (responseList) {
                      return SliverToBoxAdapter(
                        child: BannerSlider(listBanner: responseList),
                      );
                    },
                  ),
                  SliverPadding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    sliver: SliverToBoxAdapter(child: _getCategoryText()),
                  ),

                  state.responseCategory.fold(
                    (error) {
                      return SliverToBoxAdapter(child: Text(error));
                    },
                    (responseList) {
                      return SliverToBoxAdapter(
                        child: CategoryItem(listCategory: responseList),
                      );
                    },
                  ),

                  SliverPadding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),

                    sliver: SliverToBoxAdapter(
                      child: _getBestSellerProductText(),
                    ),
                  ),

                  state.responseProductBestSeller.fold(
                    (error) {
                      return SliverToBoxAdapter(child: Text(error));
                    },
                    (responseList) {
                      return SliverToBoxAdapter(
                        child: ProductItem(listProduct: responseList),
                      );
                    },
                  ),

                  SliverPadding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),

                    sliver: SliverToBoxAdapter(child: _getHotestProductText()),
                  ),

                  state.responseProductHotest.fold(
                    (error) {
                      return SliverToBoxAdapter(child: Text(error));
                    },
                    (responseList) {
                      return SliverToBoxAdapter(
                        child: ProductItem(listProduct: responseList),
                      );
                    },
                  ),
                ],
              );
            }

            return Text('saeed');
          },
        ),
      ),
    );
  }
}

//=========================
class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

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
            Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 180.w,
                  height: 40.h,
                  child: TextField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      hint: Text(
                        'جستجوی محصولات',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'SM',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff858585),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 7.w),
                Image.asset('images/icon_search.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//==========================

Widget _getCategoryText() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        'دسته بندی',
        style: TextStyle(
          fontFamily: 'SM',
          fontWeight: FontWeight.w700,
          fontSize: 12.sp,
          color: Color(0xff858585),
        ),
      ),
    ],
  );
}
// ========================

Widget _getBestSellerProductText() {
  return Row(
    children: [
      Row(
        children: [
          Image.asset('images/icon_left_categroy.png'),
          SizedBox(width: 5.w),
          Text(
            'مشاهده همه',
            style: TextStyle(
              color: Colors.indigo,
              fontFamily: 'SM',
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
      Spacer(),
      Text(
        'پر فروش ترین ها',
        style: TextStyle(
          color: Color(0xff858585),
          fontFamily: 'SM',
          fontWeight: FontWeight.w700,
          fontSize: 12.sp,
        ),
      ),
    ],
  );
}

//==================================
Widget _getHotestProductText() {
  return Row(
    children: [
      Row(
        children: [
          Image.asset('images/icon_left_categroy.png'),
          SizedBox(width: 5.w),
          Text(
            'مشاهده همه',
            style: TextStyle(
              color: Colors.indigo,
              fontFamily: 'SM',
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
      Spacer(),
      Text(
        'پر بازدید ترین ها',
        style: TextStyle(
          color: Color(0xff858585),
          fontFamily: 'SM',
          fontWeight: FontWeight.w700,
          fontSize: 12.sp,
        ),
      ),
    ],
  );
}
