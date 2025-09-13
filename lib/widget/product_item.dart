import 'package:apple_market/bloc/product_bloc/product_bloc.dart';
import 'package:apple_market/model/product.dart';
import 'package:apple_market/screens/detail_screen.dart';
import 'package:apple_market/widget/cashed_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatefulWidget {
  final List<Product> listProduct;
  const ProductItem({super.key, required this.listProduct});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            itemCount: widget.listProduct.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150.w,
                  height: 180.h,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => ProductBloc(),
                                child: DetailScreen(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 150.w,
                          height: 130.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              topRight: Radius.circular(15.r),
                            ),
                          ),
                          child: Stack(
                            alignment: AlignmentGeometry.topCenter,
                            children: [
                              Positioned(
                                top: 5,
                                child: SizedBox(
                                  height: 100.h,
                                  width: 90.w,
                                  child: CashedImage(
                                    imageUrl:
                                        widget.listProduct[index].thumbnail,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5.h,
                                right: 10.w,
                                child: Image.asset(
                                  'images/active_fav_product.png',
                                ),
                              ),

                              Positioned(
                                bottom: 20.h,
                                left: 5.w,
                                child: Container(
                                  width: 26.w,
                                  height: 14.h,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    '${widget.listProduct[index].persent!.round().toString()} ٪',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'SM',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 14.w,
                                bottom: 2.h,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    maxLines: 1,
                                    widget.listProduct[index].name,
                                    style: TextStyle(
                                      overflow: TextOverflow.clip,
                                      fontFamily: 'SM',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 150.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'تومان',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SM',
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(width: 8.w),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.listProduct[index].price.toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    decoration: TextDecoration.lineThrough,

                                    color: Colors.white,
                                    fontFamily: 'SM',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  widget.listProduct[index].discountPrice
                                      .toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontFamily: 'SM',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 8.w),
                            Image.asset(
                              'images/icon_right_arrow_cricle.png',
                              width: 22.w,
                            ),
                          ],
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
    );
  }
}
