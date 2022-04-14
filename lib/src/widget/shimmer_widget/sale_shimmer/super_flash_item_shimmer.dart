import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class SuperFlashItemShimmer extends StatelessWidget {
  const SuperFlashItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return ListView(
      padding: EdgeInsets.only(
        bottom: 16 * h,
      ),
      children: [
        Shimmer.fromColors(
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
              SizedBox(
                height: 282 * h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 165 * w,
                      margin: EdgeInsets.only(
                        right: 13 * w,
                      ),
                      child: Container(
                        height: 282 * h,
                        width: 165 * w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColor.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 12 * h,
              ),
              SizedBox(
                height: 282 * h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 165 * w,
                      margin: EdgeInsets.only(
                        right: 13 * w,
                      ),
                      child: Container(
                        height: 282 * h,
                        width: 165 * w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColor.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
