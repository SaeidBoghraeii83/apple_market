import 'package:apple_market/model/banner.dart';
import 'package:apple_market/widget/cashed_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  final List<Baner> listBanner;
  BannerSlider({super.key, required this.listBanner});
  final bannerController = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomCenter,
      children: [
        SizedBox(
          // width: 400,
          height: 140.h,
          child: PageView.builder(
            itemCount: listBanner.length,
            controller: bannerController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CashedImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        listBanner[index].thumbnail ?? 'error data thumbnail',
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 5,
          child: SmoothPageIndicator(
            controller: bannerController,
            count: listBanner.length,
            effect: ExpandingDotsEffect(
              dotHeight: 7.h,
              activeDotColor: Colors.blue,
              dotColor: Colors.white,
              dotWidth: 10.w,
              // type: WormType.thinUnderground,
            ),
          ),
        ),
      ],
    );
  }
}
