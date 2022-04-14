import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/action_widget.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/search_widget.dart';
import 'package:shimmer/shimmer.dart';

class ExploreScreenShimmer extends StatefulWidget {
  const ExploreScreenShimmer({Key? key}) : super(key: key);

  @override
  State<ExploreScreenShimmer> createState() => _ExploreScreenShimmerState();
}

class _ExploreScreenShimmerState extends State<ExploreScreenShimmer> {
  int itemCount = 4;

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    double size = (MediaQuery.of(context).size.width - 98 * w) / 4;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0.15 * h,
        automaticallyImplyLeading: false,
        title: const SearchWidget(),
        centerTitle: false,
        actions: const [
          ActionWidget(),
        ],
      ),
      body: Shimmer.fromColors(
        baseColor: AppColor.shimmerBaseColor,
        highlightColor: AppColor.shimmerHighColor,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 21 * h,
                  width: 120 * w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.grey,
                  ),
                  margin: EdgeInsets.only(
                    top: 16 * h,
                    left: 16 * w,
                    bottom: 21 * h,
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: (7 + itemCount - 1) ~/ itemCount,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: index * itemCount >= 7
                              ? Container()
                              : SizedBox(
                                  width: size,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size,
                                        width: size,
                                        padding: EdgeInsets.all(18 * h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(66),
                                          color: AppColor.gray,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8 * h,
                                      ),
                                      Container(
                                        width: size,
                                        height: 20 * h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColor.gray,
                                        ),
                                        margin: EdgeInsets.only(bottom: 16 * h),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        Expanded(
                          child: index * itemCount + 1 >= 7
                              ? Container()
                              : SizedBox(
                                  width: size,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size,
                                        width: size,
                                        padding: EdgeInsets.all(18 * h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(66),
                                          color: AppColor.gray,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8 * h,
                                      ),
                                      Container(
                                        width: size,
                                        height: 20 * h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColor.gray,
                                        ),
                                        margin: EdgeInsets.only(bottom: 16 * h),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        Expanded(
                          child: index * itemCount + 2 >= 7
                              ? Container()
                              : SizedBox(
                                  width: size,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size,
                                        width: size,
                                        padding: EdgeInsets.all(18 * h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(66),
                                          color: AppColor.gray,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8 * h,
                                      ),
                                      Container(
                                        width: 70 * w,
                                        height: 20 * h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColor.gray,
                                        ),
                                        margin: EdgeInsets.only(bottom: 16 * h),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        Expanded(
                          child: index * itemCount + 3 >= 7
                              ? Container()
                              : SizedBox(
                                  width: size,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size,
                                        width: size,
                                        padding: EdgeInsets.all(18 * h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(66),
                                          color: AppColor.gray,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8 * h,
                                      ),
                                      Container(
                                        width: 70 * w,
                                        height: 20 * h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColor.gray,
                                        ),
                                        margin: EdgeInsets.only(bottom: 16 * h),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  height: 21 * h,
                  width: 120 * w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.grey,
                  ),
                  margin: EdgeInsets.only(
                    top: 8 * h,
                    left: 16 * w,
                    bottom: 12 * h,
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: (7 + itemCount - 1) ~/ itemCount,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: index * itemCount >= 7
                              ? Container()
                              : SizedBox(
                                  width: size,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size,
                                        width: size,
                                        padding: EdgeInsets.all(18 * h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(66),
                                          color: AppColor.gray,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8 * h,
                                      ),
                                      Container(
                                        width: 70 * w,
                                        height: 20 * h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColor.gray,
                                        ),
                                        margin: EdgeInsets.only(bottom: 16 * h),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        Expanded(
                          child: index * itemCount + 1 >= 7
                              ? Container()
                              : SizedBox(
                                  width: size,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size,
                                        width: size,
                                        padding: EdgeInsets.all(18 * h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(66),
                                          color: AppColor.gray,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8 * h,
                                      ),
                                      Container(
                                        width: 70 * w,
                                        height: 20 * h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColor.gray,
                                        ),
                                        margin: EdgeInsets.only(bottom: 16 * h),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        Expanded(
                          child: index * itemCount + 2 >= 7
                              ? Container()
                              : SizedBox(
                                  width: size,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size,
                                        width: size,
                                        padding: EdgeInsets.all(18 * h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(66),
                                          color: AppColor.gray,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8 * h,
                                      ),
                                      Container(
                                        width: 70 * w,
                                        height: 20 * h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColor.gray,
                                        ),
                                        margin: EdgeInsets.only(bottom: 16 * h),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        Expanded(
                          child: index * itemCount + 3 >= 7
                              ? Container()
                              : SizedBox(
                                  width: size,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size,
                                        width: size,
                                        padding: EdgeInsets.all(18 * h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(66),
                                          color: AppColor.gray,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8 * h,
                                      ),
                                      Container(
                                        width: 70 * w,
                                        height: 20 * h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColor.gray,
                                        ),
                                        margin: EdgeInsets.only(bottom: 16 * h),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
