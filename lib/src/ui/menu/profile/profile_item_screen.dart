import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/leading_widget.dart';

class ProfileItemScreen extends StatefulWidget {
  const ProfileItemScreen({Key? key}) : super(key: key);

  @override
  _ProfileItemScreenState createState() => _ProfileItemScreenState();
}

class _ProfileItemScreenState extends State<ProfileItemScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leadingWidth: 52 * w,
        backgroundColor: AppColor.white,
        elevation: 0.15 * h,
        leading: const LeadingWidget(),
        centerTitle: false,
        title: Text(
          "Profile",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16 * h,
            fontFamily: AppColor.fontFamilyPoppins,
            height: 24 / 16 * h,
            letterSpacing: 0.5 * w,
            color: AppColor.dark,
          ),
        ),
        titleSpacing: 0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 25 * h,
          ),
          Row(
            children: [
              Container(
                height: 72 * h,
                width: 72 * h,
                margin: EdgeInsets.only(
                  left: 16 * w,
                ),
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(36),
                  child: Image.asset(
                    "assets/images/profile_png.png",
                    height: 72 * h,
                    width: 72 * h,
                  ),
                ),
              ),
              SizedBox(
                width: 16 * w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Maximus Gold",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 21 / 14 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.dark,
                    ),
                  ),
                  SizedBox(
                    height: 4 * h,
                  ),
                  Text(
                    "@derlaxy",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 22 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 32 * h,
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
                    "assets/icons/gender.svg",
                    height: 24 * h,
                    width: 24 * h,
                    color: AppColor.blue,
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Expanded(
                    child: Text(
                      "Gender",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12 * h,
                        fontFamily: AppColor.fontFamilyPoppins,
                        height: 18 / 12 * h,
                        letterSpacing: 0.5 * w,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  Text(
                    "Male",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 22 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.grey,
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/arrow_right.svg",
                    height: 24 * h,
                    width: 24 * h,
                  ),
                  SizedBox(
                    width: 16 * w,
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
                    "assets/icons/date.svg",
                    height: 24 * h,
                    width: 24 * h,
                    color: AppColor.blue,
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Expanded(
                    child: Text(
                      "Birthday",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12 * h,
                        fontFamily: AppColor.fontFamilyPoppins,
                        height: 18 / 12 * h,
                        letterSpacing: 0.5 * w,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  Text(
                    "12-12-2000",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 22 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.grey,
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/arrow_right.svg",
                    height: 24 * h,
                    width: 24 * h,
                  ),
                  SizedBox(
                    width: 16 * w,
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
                    "assets/icons/message.svg",
                    height: 24 * h,
                    width: 24 * h,
                    color: AppColor.blue,
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Expanded(
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12 * h,
                        fontFamily: AppColor.fontFamilyPoppins,
                        height: 18 / 12 * h,
                        letterSpacing: 0.5 * w,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  Text(
                    "Derlaxy@yahoo.com",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 22 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.grey,
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/arrow_right.svg",
                    height: 24 * h,
                    width: 24 * h,
                  ),
                  SizedBox(
                    width: 16 * w,
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
                    "assets/icons/phone.svg",
                    height: 24 * h,
                    width: 24 * h,
                    color: AppColor.blue,
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Expanded(
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12 * h,
                        fontFamily: AppColor.fontFamilyPoppins,
                        height: 18 / 12 * h,
                        letterSpacing: 0.5 * w,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  Text(
                    "(307) 555-0133",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 22 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.grey,
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/arrow_right.svg",
                    height: 24 * h,
                    width: 24 * h,
                  ),
                  SizedBox(
                    width: 16 * w,
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
                    "assets/icons/password.svg",
                    height: 24 * h,
                    width: 24 * h,
                    color: AppColor.blue,
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Expanded(
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12 * h,
                        fontFamily: AppColor.fontFamilyPoppins,
                        height: 18 / 12 * h,
                        letterSpacing: 0.5 * w,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  Text(
                    "•••••••••••••••••",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 22 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.grey,
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/arrow_right.svg",
                    height: 24 * h,
                    width: 24 * h,
                  ),
                  SizedBox(
                    width: 16 * w,
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
