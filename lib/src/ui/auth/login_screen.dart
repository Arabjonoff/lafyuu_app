import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    double we = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0 * h),
        child: AppBar(
          elevation: 0,
          backgroundColor: AppColor.white,
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 72 * h,
              width: 72 * h,
              margin: EdgeInsets.only(
                top: 132 * h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.blue,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/vector.svg",
                  height: 32 * h,
                  width: 32 * h,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16 * h,
          ),
          Center(
            child: Text(
              "Welcome to Lafyuu",
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
          SizedBox(
            height: 8 * h,
          ),
          Center(
            child: Text(
              "Sign in to continue",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12 * h,
                fontFamily: AppColor.fontFamilyPoppins,
                height: 22 / 12 * h,
                letterSpacing: 0.5 * w,
                color: AppColor.grey,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 48 * h,
                  width: we,
                  margin: EdgeInsets.only(
                    top: 28 * h,
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.neutralLight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16 * w,
                      ),
                      SvgPicture.asset(
                        "assets/icons/message.svg",
                        height: 24 * h,
                        width: 24 * h,
                      ),
                      SizedBox(
                        width: 10 * w,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controllerEmail,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            height: 22 / 12 * h,
                            letterSpacing: 0.5 * w,
                            color: AppColor.grey,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Your Email",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12 * h,
                              fontFamily: AppColor.fontFamilyPoppins,
                              height: 22 / 12 * h,
                              letterSpacing: 0.5 * w,
                              color: AppColor.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10 * w,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 48 * h,
                  width: we,
                  margin: EdgeInsets.only(
                    top: 8 * h,
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.neutralLight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16 * w,
                      ),
                      SvgPicture.asset(
                        "assets/icons/password.svg",
                        height: 24 * h,
                        width: 24 * h,
                      ),
                      SizedBox(
                        width: 10 * w,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controllerPassword,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            height: 22 / 12 * h,
                            letterSpacing: 0.5 * w,
                            color: AppColor.grey,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12 * h,
                              fontFamily: AppColor.fontFamilyPoppins,
                              height: 22 / 12 * h,
                              letterSpacing: 0.5 * w,
                              color: AppColor.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10 * w,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 48 * h,
                  width: we,
                  margin: EdgeInsets.only(
                    top: 16 * h,
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.blue,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(
                          0,
                          10,
                        ),
                        blurRadius: 30,
                        color: AppColor.blue.withOpacity(0.24),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14 * h,
                        fontFamily: AppColor.fontFamilyPoppins,
                        height: 25 / 14 * h,
                        letterSpacing: 0.5 * w,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 21 * h,
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 134 * w,
                        height: 1 * h,
                        color: AppColor.neutralLight,
                      ),
                      const Spacer(),
                      Expanded(
                        child: Text(
                          "OR",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            height: 21 / 14 * h,
                            letterSpacing: 0.5 * w,
                            color: AppColor.grey,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 134 * w,
                        height: 1 * h,
                        color: AppColor.neutralLight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
