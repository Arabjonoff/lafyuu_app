import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';

import 'cart/cart_screen.dart';
import 'exlopore/exlopore_screen.dart';
import 'home/home_screen.dart';
import 'offer/offer_screen.dart';
import 'profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);

    return Scaffold(
      body: [
        HomeScreen(
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        const ExploreScreen(),
        const CartScreen(),
        const OfferScreen(),
        const ProfileScreen(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (_index) {
          setState(() {
            _selectedIndex = _index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.white,
        currentIndex: _selectedIndex,
        selectedFontSize: 14 * h,
        unselectedFontSize: 14 * h,
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.grey,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: AppColor.fontFamilyPoppins,
          height: 15 / 10 * h,
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: AppColor.fontFamilyPoppins,
          height: 15 / 10 * h,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  _selectedIndex == 0
                      ? "assets/icons/home_selected.svg"
                      : "assets/icons/home_unselected.svg",
                ),
              ],
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  _selectedIndex == 1
                      ? "assets/icons/search_selected.svg"
                      : "assets/icons/search_unselected.svg",
                ),
              ],
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  _selectedIndex == 2
                      ? "assets/icons/cart_selected.svg"
                      : "assets/icons/cart_unselected.svg",
                ),
              ],
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  _selectedIndex == 3
                      ? "assets/icons/offer_selected.svg"
                      : "assets/icons/offer_unselected.svg",
                ),
              ],
            ),
            label: "Offer",
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  _selectedIndex == 4
                      ? "assets/icons/profile_selected.svg"
                      : "assets/icons/profile_unselected.svg",
                ),
              ],
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
