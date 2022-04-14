import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighColor,
      child: SizedBox(
        height: 144 * h,
        child: ListView.builder(
            padding: EdgeInsets.only(
              top: 12 * h,
              left: 16 * w,
              right: 16 * w,
            ),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 70 * h,
                margin: EdgeInsets.only(
                  right: 12 * w,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 70 * h,
                      width: 70 * h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        color: AppColor.white,
                      ),
                    ),
                    Container(
                      height: 16 * h,
                      width: 70 * w,
                      margin: EdgeInsets.only(
                        left: 5 * w,
                        top: 8 * h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
