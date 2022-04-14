import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/bloc/category/category_bloc.dart';
import 'package:lafyuu/src/model/all_category/category_model.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/action_widget.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/search_widget.dart';
import 'package:lafyuu/src/widget/grid_view_widget/category_grid_view_widget.dart';
import 'package:lafyuu/src/widget/shimmer_widget/explore_shimmer/explore_screen_shimmer.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int itemCount = 4;

  @override
  void initState() {
    categoryBloc.allCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    double size = (MediaQuery.of(context).size.width - 98 * w) / 4;
    return StreamBuilder<List<List<CategoryResult>>>(
      stream: categoryBloc.getCategory,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<List<CategoryResult>> data = snapshot.data!;
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
            body: ListView.builder(
              padding: EdgeInsets.only(
                left: 16 * w,
                right: 16 * w,
                bottom: 24 * h,
              ),
              itemBuilder: (context, index) {
                List<CategoryResult> item = data[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 12 * h),
                    Text(
                      data[index].first.genderType.genderType,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14 * h,
                        fontFamily: AppColor.fontFamilyPoppins,
                        height: 21 / 14 * h,
                        letterSpacing: 0.5 * w,
                        color: AppColor.dark,
                      ),
                    ),
                    SizedBox(height: 16 * h),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (item.length + itemCount - 1) ~/ itemCount,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: index * itemCount >= item.length
                                  ? Container()
                                  : CategoryGridViewWidget(
                                      size: size,
                                      data: item[index * itemCount]),
                            ),
                            SizedBox(width: 22 * w),
                            Expanded(
                              child: index * itemCount + 1 >= item.length
                                  ? Container()
                                  : CategoryGridViewWidget(
                                      size: size,
                                      data: item[index * itemCount + 1],
                                    ),
                            ),
                            SizedBox(width: 22 * w),
                            Expanded(
                              child: index * itemCount + 2 >= item.length
                                  ? Container()
                                  : CategoryGridViewWidget(
                                      size: size,
                                      data: item[index * itemCount + 2],
                                    ),
                            ),
                            SizedBox(width: 22 * w),
                            Expanded(
                              child: index * itemCount + 3 >= item.length
                                  ? Container()
                                  : CategoryGridViewWidget(
                                      size: size,
                                      data: item[index * itemCount + 3],
                                    ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                );
              },
              itemCount: data.length,
            ),
          );
        }
        return const ExploreScreenShimmer();
      },
    );
  }
}
