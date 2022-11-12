import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:state_hotel_project/ui/screens/home_view/user_profile_view/user_profile_view.dart';

import 'cart_view/cart_view.dart';
import 'category_view/all_category_view/all_category_view.dart';
import 'home_view/home_view.dart';

class BottamNavigatonView extends StatefulWidget {
  const BottamNavigatonView({Key? key}) : super(key: key);

  @override
  State<BottamNavigatonView> createState() => _BottamNavigatonViewState();
}

class _BottamNavigatonViewState extends State<BottamNavigatonView> {
  List pages = [
    HomeView(),
    AllCategoryView(),
    CartView(),
    UserProfileView(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        body: pages[currentIndex],
      ),
    );
  }

  Widget get bottomNavigationBar {
    return Container(
      margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.w, bottom: 5.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: BottomNavigationBar(
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            iconSize: 25,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            //  showSelectedLabels: false,
            // showUnselectedLabels: false,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black26,
            elevation: 10,
            items: const [
              BottomNavigationBarItem(
                  label: "Home", icon: Icon(Icons.home_filled)),
              BottomNavigationBarItem(
                  label: "Category", icon: Icon(Icons.category)),
              BottomNavigationBarItem(
                  label: "Cart", icon: Icon(Icons.shopping_cart_rounded)),
              BottomNavigationBarItem(
                  label: "User", icon: Icon(Icons.person_outlined)),
            ]),
      ),
    );
  }
}
