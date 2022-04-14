import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Container(
      padding: EdgeInsets.only(
        top: 7.5 * h,
        bottom: 7.5 * h,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColor.gray,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 16 * h,
            width: 16 * h,
            margin: EdgeInsets.only(
              left: 16 * w,
            ),
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
          SizedBox(
            width: 8 * w,
          ),
          Text(
            "Search Product",
            style: TextStyle(
              color: AppColor.grey,
              fontFamily: AppColor.fontFamilyPoppins,
              height: 22 / 12 * h,
              fontSize: 12 * h,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
