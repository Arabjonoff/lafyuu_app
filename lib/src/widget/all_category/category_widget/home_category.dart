import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/model/all_category/category_model.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/grid_view_widget/category_grid_view_widget.dart';

class HomeCategory extends StatefulWidget {
  final List<CategoryResult> results;

  const HomeCategory({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return SizedBox(
      height: 144 * h,
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: 12 * h,
          left: 16 * w,
          right: 16 * w,
        ),
        itemCount: widget.results.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryGridViewWidget(
            margin: EdgeInsets.only(right: 12 * w),
            size: 70 * h,
            data: widget.results[index],
          );
        },
      ),
    );
  }
}
