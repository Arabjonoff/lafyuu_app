import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0.15 * h,
        centerTitle: false,
        title: Text(
          "Account",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16 * h,
            fontFamily: AppColor.fontFamilyPoppins,
            height: 24 / 16 * h,
            letterSpacing: 0.5 * w,
            color: AppColor.dark,
          ),
        ),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 16 * w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/user.svg",
                    height: 24 * h,
                    width: 24 * h,
                    color: AppColor.blue,
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 18 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.dark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 16 * w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/bag.svg",
                    height: 24 * h,
                    width: 24 * h,
                    color: AppColor.blue,
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "Order",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 18 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.dark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 16 * w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/location.svg",
                    height: 24 * h,
                    width: 24 * h,
                    color: AppColor.blue,
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "Address",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 18 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.dark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 16 * w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/card.svg",
                    height: 24 * h,
                    width: 24 * h,
                    color: AppColor.blue,
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "Payment",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 18 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.dark,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
