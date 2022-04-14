import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/model/all_category/super_flash_model.dart';
import 'package:lafyuu/src/utils/utils.dart';

class OfferWidget extends StatefulWidget {
  final SuperFlashResult data;

  const OfferWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _OfferWidgetState createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OfferWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Stack(
      children: [
        Container(
          height: 206 * h,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            left: 16 * w,
            right: 16 * w,
            bottom: 16 * w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
             widget.data.image,
              height: 206*h,
              width: MediaQuery.of(context).size.width * 0.9,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(
              top: 48 * h,
              left: 40 * w,
            ),
            padding: EdgeInsets.only(
              right: 36 * w,
            ),
            child: Text(
              widget.data.name +
                  " " +
                 widget.data.percent.toString() +
                  " % Off",
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
               widget.data.endDate.hour.toString(),
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
               widget.data.endDate.minute.toString(),
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
               widget.data.endDate.second.toString(),
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
