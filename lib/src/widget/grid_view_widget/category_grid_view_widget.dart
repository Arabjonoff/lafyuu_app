import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/model/all_category/category_model.dart';
import 'package:lafyuu/src/utils/utils.dart';

class CategoryGridViewWidget extends StatefulWidget {
  final double size;
  final EdgeInsets margin;
  final CategoryResult data;

  const CategoryGridViewWidget({
    Key? key,
    required this.size,
    this.margin = EdgeInsets.zero,
    required this.data,
  }) : super(key: key);

  @override
  _CategoryGridViewWidgetState createState() => _CategoryGridViewWidgetState();
}

class _CategoryGridViewWidgetState extends State<CategoryGridViewWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Container(
      width: widget.size,
      margin: widget.margin,
      child: Column(
        children: [
          Container(
            height: widget.size,
            width: widget.size,
            padding: EdgeInsets.all(18 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              border: Border.all(
                color: AppColor.gray,
              ),
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: widget.data.image,
                placeholder: (context, url) => const CircularProgressIndicator.adaptive(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(height: 8 * h),
          Text(
            widget.data.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10 * h,
              fontFamily: AppColor.fontFamilyPoppins,
              height: 15 / 10 * h,
              letterSpacing: 0.5 * w,
              color: AppColor.grey,
            ),
          ),
          SizedBox(height: 12 * h),
        ],
      ),
    );
  }
}
