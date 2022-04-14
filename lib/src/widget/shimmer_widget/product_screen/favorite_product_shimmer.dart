import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteProductShimmer extends StatefulWidget {
  const FavoriteProductShimmer({Key? key}) : super(key: key);

  @override
  _FavoriteProductShimmerState createState() => _FavoriteProductShimmerState();
}

class _FavoriteProductShimmerState extends State<FavoriteProductShimmer> {
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighColor,
      child: Column(
        children: [
          SizedBox(
            height: 274 * h,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 12*h,left: 16*w,right: 16*w,bottom: 12*h,),
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 165 * w,
                    margin: EdgeInsets.only(
                      right: 13 * w,
                    ),
                    child: Container(
                      height: 295 * h,
                      width: 165 * w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.white,
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 274 * h,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 16*w,right: 16*w,bottom: 12*h,),
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 165 * w,
                    margin: EdgeInsets.only(
                      right: 13 * w,
                    ),
                    child: Container(
                      height: 295 * h,
                      width: 165 * w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.white,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
