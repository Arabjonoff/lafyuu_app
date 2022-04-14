import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class CartScreenShimmer extends StatelessWidget {
  const CartScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Shimmer.fromColors(
      child: ListView.builder(
          padding: EdgeInsets.only(
            top: 16 * h,
            bottom: 16 * h,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: 105 * h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                left: 16 * w,
                right: 16 * w,
                bottom: 16 * h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.white,
              ),
            );
          }),
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighColor,
    );
  }
}
