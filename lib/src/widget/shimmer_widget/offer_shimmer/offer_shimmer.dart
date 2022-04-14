import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class OfferShimmer extends StatelessWidget {
  const OfferShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Shimmer.fromColors(
      child: ListView.builder(
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            top: 16 * h,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              height: 206 * h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.white,
              ),
              margin: EdgeInsets.only(
                left: 16 * w,
                right: 16 * w,
                bottom: 16 * h,
              ),
            );
          }),
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighColor,
    );
  }
}
