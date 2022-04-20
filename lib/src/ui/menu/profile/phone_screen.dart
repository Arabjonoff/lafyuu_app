import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/leading_widget.dart';

class PhoneScreen extends StatefulWidget {
  final String number;
  final Function(String _phone) save;

  const PhoneScreen({
    Key? key,
    required this.save,
    required this.number,
  }) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController _controllerPhone = TextEditingController();

  @override
  void initState() {
    _controllerPhone.text = widget.number;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    double we = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leadingWidth: 52 * w,
        backgroundColor: AppColor.white,
        elevation: 0.15 * h,
        leading: const LeadingWidget(),
        centerTitle: false,
        title: Text(
          "Phone Number",
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
                    "Phone Number",
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
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: _controllerPhone,
                    decoration: InputDecoration(
                      counterText: "",
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.blue,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.neutralLight),
                      ),
                      prefixIcon: const Align(
                        widthFactor: 0,
                        heightFactor: 0,
                        child: Icon(
                          Icons.phone_android,
                        ),
                      ),
                      prefixText: "+998",
                      prefixStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12 * h,
                        fontFamily: AppColor.fontFamilyPoppins,
                        height: 22 / 12 * h,
                        letterSpacing: 0.5 * w,
                        color: AppColor.grey,
                      ),
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 22 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.grey,
                    ),
                    maxLength: 9,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_controllerPhone.text.length == 9) {
                widget.save(
                  _controllerPhone.text,
                );
              }
              Navigator.pop(context);
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
