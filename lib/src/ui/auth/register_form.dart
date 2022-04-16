import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
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
            height: 8 * h,
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
          Expanded(
            child: ListView(
              children: [

              ],
            ),
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
