import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class FlashSaleShimmer extends StatelessWidget {
  const FlashSaleShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighColor,
      child: SizedBox(
        height: 274 * h,
        child: ListView.builder(
            padding: EdgeInsets.only(
              top: 12 * h,
              left: 16 * w,
              right: 16 * w,
              bottom: 16 * h,
            ),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 141 * w,
                margin: EdgeInsets.only(
                  right: 16 * w,
                ),
                child: Container(
                  height: 238 * h,
                  width: 141 * w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.white,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
