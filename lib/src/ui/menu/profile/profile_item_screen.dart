import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/ui/menu/profile/birthday_screen.dart';
import 'package:lafyuu/src/ui/menu/profile/gender_screen.dart';
import 'package:lafyuu/src/ui/menu/profile/name_edit_screen.dart';
import 'package:lafyuu/src/ui/menu/profile/phone_screen.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/leading_widget.dart';

class ProfileItemScreen extends StatefulWidget {
  const ProfileItemScreen({Key? key}) : super(key: key);

  @override
  _ProfileItemScreenState createState() => _ProfileItemScreenState();
}

class _ProfileItemScreenState extends State<ProfileItemScreen> {
  DateTime birthday = DateTime.now();
  String firstName = "Diyorbek";
  String lastName = "Jumaniyozov";
  String phoneNumber = "";

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return NameEditScreen(
                    firstName: firstName,
                    lastName: lastName,
                    save: (String _choose, _lastName) {
                      setState(() {
                        firstName = _choose;
                        lastName = _lastName;
                      });
                    },
                  );
                }),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                top: 25 * h,
              ),
              padding: EdgeInsets.only(
                right: 16 * w,
              ),
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 72 * h,
                      width: 72 * h,
                      margin: EdgeInsets.only(
                        left: 16 * w,
                        right: 16 * w,
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
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            firstName,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14 * h,
                              fontFamily: AppColor.fontFamilyPoppins,
                              height: 21 / 14 * h,
                              letterSpacing: 0.5 * w,
                              color: AppColor.dark,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 2 * w,
                          ),
                          Text(
                            lastName,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14 * h,
                              fontFamily: AppColor.fontFamilyPoppins,
                              height: 21 / 14 * h,
                              letterSpacing: 0.5 * w,
                              color: AppColor.dark,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
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
            ),
          ),
          SizedBox(
            height: 32 * h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return GenderScreen();
                }),
              );
            },
            child: Container(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return BirthdayScreen(
                    dateTime: birthday,
                    save: (DateTime _choose) {
                      setState(() {
                        birthday = _choose;
                      });
                    },
                  );
                }),
              );
            },
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
                    Utils.numberFormat(birthday.day) +
                        "/" +
                        Utils.numberFormat(birthday.month) +
                        "/" +
                        Utils.numberFormat(birthday.year),
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
            child: Container(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return PhoneScreen(
                    number: phoneNumber,
                    save: (String _phoneNumber) {
                      setState(() {
                        phoneNumber = _phoneNumber;
                      });
                    },
                  );
                }),
              );
            },
            child: Container(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
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
                    phoneNumber,
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
            child: Container(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
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
