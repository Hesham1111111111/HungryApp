import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/resources/app_colors.dart';
import 'package:hungry/feachers/auth/presentation/view/profile_view.dart';
import 'package:hungry/feachers/home/presentation/views/home_view.dart';
import 'package:hungry/feachers/orderhistory/presentaion/views/order_view.dart';
import 'feachers/card/presentation/card_view.dart';

class Root extends StatefulWidget {
  Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeView(),
    CardView(),
    OrderView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey.shade500.withOpacity(0.7),
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() => currentIndex = index);
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          selectedFontSize: 12.sp,
          unselectedFontSize: 11.sp,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home, size: 22.sp),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart, size: 22.sp),
              label: "Card",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant, size: 22.sp),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled, size: 22.sp),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
