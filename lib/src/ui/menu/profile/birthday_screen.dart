import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/leading_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class BirthdayScreen extends StatefulWidget {
  final DateTime dateTime;

  const BirthdayScreen({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  @override
  _BirthdayScreenState createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  bool isSelected = false;
  DateTime time = DateTime.now();

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
          "Birthday",
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
                    "Your Birhday",
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
                    setState(() {
                      isSelected = !isSelected;
                    });
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
                        color: Colors.transparent),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            Utils.numberFormat(time.day) +
                                "/" +
                                Utils.numberFormat(time.month) +
                                "/" +
                                Utils.numberFormat(time.year),
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
                        SvgPicture.asset(
                          "assets/icons/date.svg",
                          height: 24 * h,
                          width: 24 * h,
                          color: AppColor.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                isSelected
                    ? TableCalendar(
                        firstDay: DateTime(1980, 02, 05),
                        lastDay: DateTime(2030, 05, 07),
                        focusedDay: time,
                        selectedDayPredicate: (day) {
                          return isSameDay(time, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            time = selectedDay;
                          });
                        },
                        headerVisible: true,
                        daysOfWeekVisible: true,
                        sixWeekMonthsEnforced: false,
                        shouldFillViewport: false,
                        headerStyle: HeaderStyle(
                          titleTextStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            height: 21 / 14 * h,
                            letterSpacing: 0.5 * w,
                            color: AppColor.dark,
                          ),
                          formatButtonShowsNext: false,
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                        calendarStyle: CalendarStyle(
                          selectedTextStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            height: 18 / 12 * h,
                            letterSpacing: 0.5 * w,
                            color: AppColor.white,
                          ),
                          todayTextStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            height: 18 / 12 * h,
                            letterSpacing: 0.5 * w,
                            color: AppColor.dark,
                          ),
                          isTodayHighlighted: true,
                          holidayTextStyle: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                            fontSize: 12 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            height: 18 / 12 * h,
                            letterSpacing: 0.5 * w,
                          ),
                          defaultTextStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            height: 18 / 12 * h,
                            letterSpacing: 0.5 * w,
                            color: AppColor.grey,
                          ),
                          weekendTextStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            height: 18 / 12 * h,
                            letterSpacing: 0.5 * w,
                            color: AppColor.grey,
                          ),
                          selectedDecoration: const BoxDecoration(
                            color: AppColor.blue,
                          ),
                          todayDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.red),
                          ),
                        ),
                      )
                    : Container(),
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
