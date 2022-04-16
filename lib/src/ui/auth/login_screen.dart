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

  bool isHiddenPassword = true;

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
      body: ListView(
        children: [
          Center(
            child: Container(
              height: 72 * h,
              width: 72 * h,
              margin: EdgeInsets.only(
                top: 112 * h,
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
          Container(
            height: 56 * h,
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
            height: 56 * h,
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
                    obscureText: isHiddenPassword,
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
                GestureDetector(
                  onTap: _togglePassword,
                  child: Container(
                    width: 32 * h,
                    height: 32 * h,
                    margin: EdgeInsets.only(
                      right: 16 * w,
                    ),
                    child: isHiddenPassword
                        ? Center(
                            child: SvgPicture.asset(
                              "assets/icons/eye.svg",
                              height: 24 * h,
                              width: 24 * h,
                            ),
                          )
                        : Center(
                            child: SvgPicture.asset(
                              "assets/icons/eye-off.svg",
                              height: 24 * h,
                              width: 24 * h,
                            ),
                          ),
                  ),
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
          Container(
            width: we,
            height: 57 * h,
            margin: EdgeInsets.only(
              top: 16 * h,
              left: 16 * w,
              right: 16 * w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColor.neutralLight,
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16 * w,
                ),
                Image.asset(
                  "assets/images/google.png",
                  height: 24 * h,
                  width: 24 * h,
                ),
                const Spacer(),
                Center(
                  child: Text(
                    "Login with Google",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 25 / 14 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.grey,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 30 * w,
                ),
              ],
            ),
          ),
          Container(
            width: we,
            height: 57 * h,
            margin: EdgeInsets.only(
              top: 8 * h,
              left: 16 * w,
              right: 16 * w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColor.neutralLight,
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16 * w,
                ),
                Image.asset(
                  "assets/images/facebook.png",
                  height: 24 * h,
                  width: 24 * h,
                ),
                const Spacer(),
                Center(
                  child: Text(
                    "Login with facebook",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 25 / 14 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.grey,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 30 * w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16 * h,
          ),
          Center(
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12 * h,
                fontFamily: AppColor.fontFamilyPoppins,
                height: 18 / 12 * h,
                letterSpacing: 0.5 * w,
                color: AppColor.blue,
              ),
            ),
          ),
          SizedBox(
            height: 8 * h,
          ),
          Row(
            children: [
              const Spacer(),
              Text(
                "Don’t have a account? ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12 * h,
                  fontFamily: AppColor.fontFamilyPoppins,
                  height: 18 / 12 * h,
                  letterSpacing: 0.5 * w,
                  color: AppColor.grey,
                ),
              ),
              Text(
                "Register",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12 * h,
                  fontFamily: AppColor.fontFamilyPoppins,
                  height: 18 / 12 * h,
                  letterSpacing: 0.5 * w,
                  color: AppColor.blue,
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  void _togglePassword() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
