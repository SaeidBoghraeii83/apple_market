import 'package:apple_market/bloc/home_bloc/category_bloc/category_bloc.dart';
import 'package:apple_market/bloc/home_bloc/home_bloc.dart';
import 'package:apple_market/screens/category_screen.dart';
import 'package:apple_market/screens/home_screen.dart';
import 'package:apple_market/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15.sp,

        selectedLabelStyle: TextStyle(
          fontFamily: 'SM',
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
        ),
        selectedItemColor: Color(0xff3B5EDF),

        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(
          fontFamily: 'SM',
          fontSize: 9.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),

        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffEEEEEE),
        currentIndex: _selectedBottomNavigationItem,
        onTap: (int index) {
          setState(() {
            _selectedBottomNavigationItem = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/icon_profile_active.png'),

            label: 'حساب کاربری',

            icon: Image.asset('images/icon_profile.png'),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/icon_basket_active.png'),
            label: 'سبد خرید',
            icon: Image.asset('images/icon_basket.png'),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/icon_category_active.png'),
            label: 'دسته بندی',
            icon: Image.asset('images/icon_category.png'),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/icon_home_active.png'),
            label: 'خانه',

            icon: Image.asset('images/home.png'),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      ProfileScreen(),
      BlocProvider(create: (context) => HomeBloc(), child: HomeScreen()),
      BlocProvider(
        create: (context) => CategoryBloc(),
        child: CategoryScreen(),
      ),

      BlocProvider(create: (context) => HomeBloc(), child: HomeScreen()),
    ];
  }
}
