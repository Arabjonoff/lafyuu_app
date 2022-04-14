import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class SuperFlashSaleShimmer extends StatefulWidget {
  const SuperFlashSaleShimmer({Key? key}) : super(key: key);

  @override
  _SuperFlashSaleShimmerState createState() => _SuperFlashSaleShimmerState();
}

class _SuperFlashSaleShimmerState extends State<SuperFlashSaleShimmer> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighColor,
      child: Column(
        children: [
          Container(
            height: 206 * h,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.white,
            ),
            margin: EdgeInsets.only(
              top: 16 * h,
              left: 16 * w,
              right: 16 * w,
            ),
          ),
          SizedBox(
            height: 16 * h,
          ),
          Container(
            height: 16 * h,
            width: 72 * w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
