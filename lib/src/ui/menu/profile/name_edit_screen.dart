import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/leading_widget.dart';

class NameEditScreen extends StatefulWidget {
  const NameEditScreen({
    Key? key,
  }) : super(key: key);

  @override
  _NameEditScreenState createState() => _NameEditScreenState();
}

class _NameEditScreenState extends State<NameEditScreen> {
  final TextEditingController _controllerFirstName =
  TextEditingController(text: "");
  final TextEditingController _controllerLastName =
  TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    double we = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leadingWidth: 52 * w,
        backgroundColor: AppColor.white,
        elevation: 0.15 * h,
        leading: const LeadingWidget(),
        centerTitle: false,
        title: Text(
          "Name",
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 16 * h,
                    left: 16 * w,
                  ),
                  child: Text(
                    "First Name",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 21 / 14 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.dark,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    height: 56 * h,
                    width: we,
                    margin: EdgeInsets.only(
                      top: 12 * h,
                      left: 16 * w,
                      right: 16 * w,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16 * w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColor.neutralLight,
                      ),
                    ),
                    child: TextField(
                      controller: _controllerFirstName,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12 * h,
                        fontFamily: AppColor.fontFamilyPoppins,
                        height: 22 / 12 * h,
                        letterSpacing: 0.5 * w,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 24 * h,
                    left: 16 * w,
                  ),
                  child: Text(
                    "Last Name",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 21 / 14 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.dark,
                    ),
                  ),
                ),
                Container(
                  height: 56 * h,
                  width: we,
                  margin: EdgeInsets.only(
                    top: 12 * h,
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16 * w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColor.neutralLight,
                    ),
                  ),
                  child: TextField(
                    controller: _controllerLastName,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 22 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.grey,
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
              right: 16 * w,
              bottom: 16 * h,
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
                "Save",
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
        ],
      ),
    );
  }
}
