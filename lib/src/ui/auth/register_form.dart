import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';

class RegisterFrom extends StatefulWidget {
  const RegisterFrom({Key? key}) : super(key: key);

  @override
  _RegisterFromState createState() => _RegisterFromState();
}

class _RegisterFromState extends State<RegisterFrom> {
  bool isHiddenPassword = true;
  bool isHiddenPasswordAgain = true;

  String a = "";
  String b = "";
  String c = "";
  String d = "";
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordAgain =
      TextEditingController();

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
          Expanded(
            child: ListView(
              children: [
                Center(
                  child: Container(
                    height: 72 * h,
                    width: 72 * h,
                    margin: EdgeInsets.only(
                      top: 155 * h,
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
                    "Let’s Get Started",
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
                    "Create an new account",
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
                    left: 16 * w,
                    right: 16 * w,
                    top: 28 * h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColor.neutralLight,
                    ),
                    color: AppColor.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16 * w,
                      ),
                      SvgPicture.asset(
                        "assets/icons/user.svg",
                        height: 24 * h,
                        width: 24 * h,
                      ),
                      SizedBox(
                        width: 10 * w,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controllerName,
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
                              hintText: "Full Name",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12 * h,
                                fontFamily: AppColor.fontFamilyPoppins,
                                height: 22 / 12 * h,
                                letterSpacing: 0.5 * w,
                                color: AppColor.grey,
                              )),
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
                    left: 16 * w,
                    right: 16 * w,
                    top: 8 * h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColor.neutralLight,
                    ),
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
                              )),
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
                    left: 16 * w,
                    right: 16 * w,
                    top: 8 * h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColor.neutralLight,
                    ),
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
                          obscureText: isHiddenPassword,
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
                              )),
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
                  height: 56 * h,
                  width: we,
                  margin: EdgeInsets.only(
                    left: 16 * w,
                    right: 16 * w,
                    top: 8 * h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColor.neutralLight,
                    ),
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
                          controller: _controllerPasswordAgain,
                          obscureText: isHiddenPasswordAgain,
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
                              hintText: "Password Again",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12 * h,
                                fontFamily: AppColor.fontFamilyPoppins,
                                height: 22 / 12 * h,
                                letterSpacing: 0.5 * w,
                                color: AppColor.grey,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10 * w,
                      ),
                      GestureDetector(
                        onTap: _togglePasswordAgain,
                        child: Container(
                          width: 32 * h,
                          height: 32 * h,
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          child: isHiddenPasswordAgain
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
                  height: 57 * h,
                  width: we,
                  margin: EdgeInsets.only(
                    left: 16 * w,
                    top: 16 * h,
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
                      "Sign Up",
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
                SizedBox(
                  height: 24 * h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "have a account? ",
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
                      "Sign In",
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

  void _togglePasswordAgain() {
    setState(() {
      isHiddenPasswordAgain = !isHiddenPasswordAgain;
    });
  }

// Future<void> _saveData(String a, String b, String c, String d) async {
//   SharedPreferences prep = await SharedPreferences.getInstance();
//   prep.setString("name", a);
//   prep.setString("email", b);
//   prep.setString("password", c);
//   prep.setString("passwordagain", d);
//   if (_controllerEmail.text == _controllerPassword.text) {
//     Navigator.pop(context);
//   } else {
//     print("xato");
//   }
// }
}
