import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class ProductScreenShimmer extends StatefulWidget {
  const ProductScreenShimmer({Key? key}) : super(key: key);

  @override
  _ProductScreenShimmerState createState() => _ProductScreenShimmerState();
}

class _ProductScreenShimmerState extends State<ProductScreenShimmer> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Shimmer.fromColors(
          child: Container(
            height: 24 * h,
            width: 144 * w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.white,
            ),
          ),
          baseColor: AppColor.shimmerBaseColor,
          highlightColor: AppColor.shimmerHighColor,
        ),
        backgroundColor: AppColor.white,
        elevation: 0.15 * h,
      ),
      body: Shimmer.fromColors(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 238 * h,
              color: Colors.white,
            ),
            Center(
              child: Container(
                height: 16 * h,
                width: 72 * w,
                margin: EdgeInsets.only(
                  top: 16 * h,
                  bottom: 16 * h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.white,
                ),
              ),
            ),
            Container(
              height: 24 * h,
              width: 200 * w,
              margin: EdgeInsets.only(
                left: 16 * w,
                bottom: 16 * h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.white,
              ),
            ),
            Container(
              height: 16 * h,
              width: 100 * w,
              margin: EdgeInsets.only(
                left: 16 * w,
                bottom: 16 * h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.white,
              ),
            ),
            Container(
              height: 24 * h,
              width: 144 * w,
              margin: EdgeInsets.only(
                left: 16 * w,
                bottom: 24 * h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.white,
              ),
            ),
            Container(
              height: 21 * h,
              width: 144 * w,
              margin: EdgeInsets.only(
                left: 16 * w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.white,
              ),
            ),
            SizedBox(
              height: 84 * h,
              child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: 12 * h,
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  itemCount: 9,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 48 * h,
                      margin: EdgeInsets.only(
                        right: 12 * w,
                      ),
                      child: Center(
                        child: Container(
                          height: 48 * h,
                          width: 48 * h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 21 * h,
              width: 144 * w,
              margin: EdgeInsets.only(
                left: 16 * w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.white,
              ),
            ),
            SizedBox(
              height: 84 * h,
              child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: 12 * h,
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  itemCount: 9,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 48 * h,
                      margin: EdgeInsets.only(
                        right: 12 * w,
                      ),
                      child: Center(
                        child: Container(
                          height: 48 * h,
                          width: 48 * h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
        baseColor: AppColor.shimmerBaseColor,
        highlightColor: AppColor.shimmerHighColor,
      ),
    );
  }
}
