import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              sliver: SliverToBoxAdapter(child: ProfileAppBar()),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.only(top: 15.h),
              sliver: SliverToBoxAdapter(child: _getProfileImage()),
            ),

            _getItemProfile(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    'مارکت شاپ',
                    style: TextStyle(
                      fontFamily: 'SM',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(
                    'V-1.0.00',
                    style: TextStyle(fontFamily: 'SM', fontSize: 6.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//=================================
class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

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
            SizedBox(width: 90.w),
            Text(
              textAlign: TextAlign.center,
              'حساب کاربری',
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

//================
Widget _getProfileImage() {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Colors.red,
        radius: 80.r,
        foregroundImage: AssetImage('images/pr.png'),
      ),
      SizedBox(height: 16.h),
      Text(
        'سعید بقرائی',
        style: TextStyle(
          fontFamily: 'SM',
          fontSize: 34.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: 10.h),

      Text(
        '+9809190073472',
        style: TextStyle(
          fontFamily: 'SM',
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}

//==============
Widget _getItemProfile() {
  final items = [
    {"icon": Icons.favorite, "title": "علاقه‌مندی ها"},
    {"icon": Icons.location_on, "title": "آدرس ها"},
    {"icon": Icons.shopping_cart, "title": "سفارشات اخیر"},
    {"icon": Icons.settings, "title": "تنظیمات"},
    {"icon": Icons.notifications, "title": "اطلاعیه"},
    {"icon": Icons.local_shipping, "title": "سفارش انجام"},
    {"icon": Icons.discount, "title": "تخفیف ها"},
    {"icon": Icons.support_agent, "title": "پشتیبانی"},
  ];

  return SliverPadding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w, vertical: 20.h),
    sliver: SliverGrid.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 1,
        mainAxisSpacing: 40,
        mainAxisExtent: 110,
      ),
      itemBuilder: (context, index) {
        final item = items[index];

        final content = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                item["icon"] as IconData,
                color: Colors.white,
                size: 28.sp,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              item["title"] as String,
              style: TextStyle(
                fontSize: 9.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'SM',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );

        return content;
      },
    ),
  );
}
