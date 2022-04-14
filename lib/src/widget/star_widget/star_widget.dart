import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
class StarWidget extends StatelessWidget {
  final double reviewAvg;
  final double size;

  const StarWidget({
    Key? key,
    required this.reviewAvg,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/star.svg",
          height: size,
          width: size,
          color: reviewAvg >= 1 ? AppColor.yellow : AppColor.gray,
        ),
        SizedBox(
          width: 2 * w,
        ),
        SvgPicture.asset(
          "assets/icons/star.svg",
          height: size,
          width: size,
          color: reviewAvg >= 2 ? AppColor.yellow : AppColor.gray,
        ),
        SizedBox(
          width: 2 * w,
        ),
        SvgPicture.asset(
          "assets/icons/star.svg",
          height: size,
          width: size,
          color: reviewAvg >= 3 ? AppColor.yellow : AppColor.gray,
        ),
        SizedBox(
          width: 2 * w,
        ),
        SvgPicture.asset(
          "assets/icons/star.svg",
          height: size,
          width: size,
          color: reviewAvg >= 4 ? AppColor.yellow : AppColor.gray,
        ),
        SizedBox(
          width: 2 * w,
        ),
        SvgPicture.asset(
          "assets/icons/star.svg",
          height: size,
          width: size,
          color: reviewAvg >= 5 ? AppColor.yellow : AppColor.gray,
        ),
      ],
    );
  }
}
