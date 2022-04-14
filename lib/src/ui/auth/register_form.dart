import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterFrom extends StatefulWidget {
  const RegisterFrom({Key? key}) : super(key: key);

  @override
  _RegisterFromState createState() => _RegisterFromState();
}

class _RegisterFromState extends State<RegisterFrom> {
  bool isHiddenPassword = true;
  bool isHiddenPassword1 = true;

  String a = "";
  String b = "";
  String c = "";
  String d = "";
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 112,
          ),
          Column(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: Color(0xFF40BFFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: SvgPicture.asset("assets/icons/vector.svg"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Center(
            child: Text(
              "Welcome to Lafyuu",
              style: TextStyle(
                fontFamily: AppColor.fontFamilyPoppins,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF223263),
                height: 1.5,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              "Sign in to continue",
              style: TextStyle(
                fontFamily: AppColor.fontFamilyPoppins,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                letterSpacing: 0.5,
                height: 1.8,
                color: Color(0xFF9098B1),
              ),
            ),
          ),
          Container(
            width: w,
            height: 48,
            margin: EdgeInsets.only(
              top: 28,
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xFFEBF0FF),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/icons/user.svg"),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyPoppins,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      height: 1.8,
                      color: Color(0xFF9098B1),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full Name",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: w,
            height: 48,
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xFFEBF0FF),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/icons/message.svg"),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller1,
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyPoppins,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      letterSpacing: 0.5,
                      height: 1.8,
                      color: Color(0xFF9098B1),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Your Email",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: w,
            height: 48,
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xFFEBF0FF),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/icons/password.svg"),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller2,
                    obscureText: isHiddenPassword,
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyPoppins,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      letterSpacing: 0.5,
                      height: 1.8,
                      color: Color(0xFF9098B1),
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintText: "Password",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _togglePasswordView,
                  child: Container(
                    width: 24,
                    height: 24,
                    margin: EdgeInsets.only(
                      right: 25,
                    ),
                    child: isHiddenPassword
                        ? SvgPicture.asset("assets/icons/eye.svg")
                        : SvgPicture.asset("assets/icons/eye-off.svg"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: w,
            height: 48,
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xFFEBF0FF),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/icons/password.svg"),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller3,
                    obscureText: isHiddenPassword1,
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyPoppins,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      letterSpacing: 0.5,
                      height: 1.8,
                      color: Color(0xFF9098B1),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password Again",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _togglePasswordView1,
                  child: Container(
                    width: 24,
                    height: 24,
                    margin: EdgeInsets.only(
                      right: 25,
                    ),
                    child: isHiddenPassword1
                        ? SvgPicture.asset("assets/icons/eye.svg")
                        : SvgPicture.asset("assets/icons/eye-off.svg"),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_controller.text.length > 0 &&
                  _controller1.text.length > 0 &&
                  _controller2.text.length > 0 &&
                  _controller3.text.length > 0) {
                _saveData(
                  _controller.text,
                  _controller1.text,
                  _controller2.text,
                  _controller3.text,
                );
              }
            },
            child: Container(
              width: w,
              height: 57,
              margin: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF40BFFF),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(
                      0,
                      10,
                    ),
                    spreadRadius: 0,
                    blurRadius: 30,
                    color: Color(0xFF40BFFF).withOpacity(0.24),
                  ),
                ],
              ),
              child: Expanded(
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyPoppins,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      height: 1.8,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "have a account? ",
                style: TextStyle(
                  fontFamily: AppColor.fontFamilyPoppins,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  letterSpacing: 0.5,
                  height: 1.5,
                  color: Color(0xFF9098B1),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontFamily: AppColor.fontFamilyPoppins,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    letterSpacing: 0.5,
                    height: 1.5,
                    color: Color(0xFF40BFFF),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void _togglePasswordView1() {
    setState(() {
      isHiddenPassword1 = !isHiddenPassword1;
    });
  }

  Future<void> _saveData(String a, String b, String c, String d) async {
    SharedPreferences prep = await SharedPreferences.getInstance();
    prep.setString("name", a);
    prep.setString("email", b);
    prep.setString("password", c);
    prep.setString("passwordagain", d);
    if (_controller2.text == _controller3.text) {
      Navigator.pop(context);
    } else {
      print("xato");
    }
  }
}
