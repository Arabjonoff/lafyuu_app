import 'package:flutter/material.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../app_color/app_color.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return SafeArea(
      child: TableCalendar(
        firstDay: DateTime.utc(1980, 02, 05),
        lastDay: DateTime.utc(2030, 05, 07),
        focusedDay: DateTime.now(),
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
          todayTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12 * h,
            fontFamily: AppColor.fontFamilyPoppins,
            height: 18 / 12 * h,
            letterSpacing: 0.5 * w,
            color: AppColor.white,
          ),
          isTodayHighlighted: true,
          holidayTextStyle:  TextStyle(
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
          todayDecoration: const BoxDecoration(
            color: AppColor.blue,
          ),
        ),
      ),
    );
  }
}
