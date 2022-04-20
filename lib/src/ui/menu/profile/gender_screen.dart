import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/leading_widget.dart';

class GenderScreen extends StatefulWidget {
  // final Function(String _gender) save;

  const GenderScreen({
    Key? key,
    // required this.save,
  }) : super(key: key);

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedValue;
  List<String> items = [
    'Male',
    'Female',
    'Other',
  ];
  @override
  void initState() {

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
          "Gender",
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
                    "Choose Gender",
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 12 * h,
                                fontWeight: FontWeight.w700,
                                fontFamily: AppColor.fontFamilyPoppins,
                                height: 22 / 12 * h,
                                letterSpacing: 0.5 * w,
                                color: AppColor.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 12 * h,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: AppColor.fontFamilyPoppins,
                                    height: 22 / 12 * h,
                                    letterSpacing: 0.5 * w,
                                    color: AppColor.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      icon: SvgPicture.asset("assets/icons/down.svg"),
                      buttonPadding: EdgeInsets.only(
                        left: 16 * w,
                        right: 16 * w,
                      ),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.neutralLight,
                        ),
                        color: AppColor.white,
                      ),
                      buttonElevation: 0,
                      itemPadding: EdgeInsets.only(
                        left: 16 * w,
                        right: 16 * w,
                      ),
                      dropdownMaxHeight: 200 * h,
                      dropdownWidth: we - 32 * w,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
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
