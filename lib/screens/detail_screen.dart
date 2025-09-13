import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

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
              sliver: SliverToBoxAdapter(child: SearchBox()),
            ),
            SliverToBoxAdapter(child: DetailContainer()),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 20.w,
                vertical: 5.h,
              ),
              sliver: SliverToBoxAdapter(child: ColorItemDetail()),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 20.w,
                vertical: 5.h,
              ),
              sliver: SliverToBoxAdapter(child: StorageItemDetail()),
            ),
          ],
        ),
      ),
    );
  }
}

//================================
// اپ بار ویجت

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('images/icon_apple_blue.png'),
            Text(
              'آیفون',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'SM',
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            Image.asset('images/icon_back.png'),
          ],
        ),
      ),
    );
  }
}

//===================================================

class DetailContainer extends StatelessWidget {
  const DetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'آیفون 13 پرو مکس',
          style: TextStyle(
            fontFamily: 'SM',
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 13.h),
        Container(
          width: 300.w,
          height: 244.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Stack(
            alignment: AlignmentGeometry.topCenter,
            children: [
              Positioned(
                top: 20.h,
                child: Image.asset(
                  'images/iphone.png',
                  width: 101.w,
                  height: 126.h,
                ),
              ),
              Positioned(
                top: 15.h,
                left: 15.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/icon_star.png'),
                    SizedBox(width: 5.w),
                    Text('۴.۶', style: TextStyle(fontFamily: 'SM')),
                  ],
                ),
              ),
              Positioned(
                top: 15.h,
                right: 15.w,
                child: Image.asset('images/icon_favorite_deactive.png'),
              ),
              Positioned(
                right: 10.w,
                left: 20.w,
                bottom: 20.h,
                child: SizedBox(
                  width: 300.w,
                  height: 80.h,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Container(
                            width: 70.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('images/iphone.png'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//=============================

class ColorItemDetail extends StatelessWidget {
  const ColorItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 10, bottom: 10),
            child: Text(
              'انتخاب رنگ',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 33.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    width: 30.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//========================================

class StorageItemDetail extends StatelessWidget {
  const StorageItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 10, bottom: 10),
            child: Text(
              'انتخاب حافظه داخلی',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(
            height: 35.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 64.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff858585), width: 0.7),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '125',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
