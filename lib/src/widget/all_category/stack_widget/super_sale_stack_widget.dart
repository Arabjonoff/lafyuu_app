import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/model/all_category/super_flash_model.dart';
import 'package:lafyuu/src/utils/utils.dart';

class SuperSaleWidget extends StatelessWidget {
  final SuperFlashResult item;

  const SuperSaleWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            item.image,
            height: 206 * h,
            width: MediaQuery.of(context).size.width * 0.9,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(
              top: 48 * h,
              left: 40 * w,
            ),
            padding: EdgeInsets.only(
              right: 16 * w,
            ),
            child: Text(
              item.name + " " + item.percent.toString() + " % Off",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24 * h,
                fontFamily: AppColor.fontFamilyPoppins,
                height: 36 / 24 * h,
                letterSpacing: 0.5 * w,
                color: AppColor.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Positioned(
          child: Container(
            height: 41 * h,
            width: 42 * w,
            margin: EdgeInsets.only(
              top: 149 * h,
              left: 40 * w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.white,
            ),
            child: Center(
              child: Text(
                item.endDate.hour.toString(),
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
          ),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(
              top: 159 * h,
              left: 86 * w,
            ),
            child: Text(
              ":",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14 * h,
                fontFamily: AppColor.fontFamilyPoppins,
                height: 21 / 14 * h,
                letterSpacing: 0.5 * w,
                color: AppColor.white,
              ),
            ),
          ),
        ),
        Positioned(
          child: Container(
            height: 41 * h,
            width: 42 * w,
            margin: EdgeInsets.only(
              top: 149 * h,
              left: 94 * w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.white,
            ),
            child: Center(
              child: Text(
                item.endDate.minute.toString(),
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
          ),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(
              top: 159 * h,
              left: 140 * w,
            ),
            child: Text(
              ":",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14 * h,
                fontFamily: AppColor.fontFamilyPoppins,
                height: 21 / 14 * h,
                letterSpacing: 0.5 * w,
                color: AppColor.white,
              ),
            ),
          ),
        ),
        Positioned(
          child: Container(
            height: 41 * h,
            width: 42 * w,
            margin: EdgeInsets.only(
              top: 149 * h,
              left: 148 * w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.white,
            ),
            child: Center(
              child: Text(
                item.endDate.second.toString(),
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
          ),
        ),
      ],
    );
  }
}
