import 'package:flutter/material.dart';
import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/utils/utils.dart';

import 'product_widget.dart';

class ProductListItemWidget extends StatefulWidget {
  final int type;
  final List<ProductListResult> results;

  const ProductListItemWidget({
    Key? key,
    required this.results,
    required this.type,
  }) : super(key: key);

  @override
  State<ProductListItemWidget> createState() => _ProductListItemWidgetState();
}

class _ProductListItemWidgetState extends State<ProductListItemWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return SizedBox(
      height: 350 * h,
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: 12 * w,
          left: 16 * w,
          bottom: 24 * h,
        ),
        itemCount: widget.results.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductWidget(
            type: widget.type,
            margin: EdgeInsets.only(
              right: 16 * w,
            ),
            width: 141 * w,
            height: 275 * h,
            data: widget.results[index],
            star: false,
            trash: false,
          );
        },
      ),
    );
  }
}
