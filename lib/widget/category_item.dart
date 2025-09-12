import 'package:apple_market/model/category.dart';
import 'package:apple_market/widget/cashed_image.dart';
import 'package:apple_market/widget/color_hex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final List<Category> listCategory;
  const CategoryItem({super.key, required this.listCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      child: ListView.builder(
        itemCount: listCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 45.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: hexToColor(listCategory[index].color),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 30.w,
                      height: 20.h,
                      child: CashedImage(
                        imageUrl: listCategory[index].icon!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.h),
                Text(
                  listCategory[index].title!,
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
