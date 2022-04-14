import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/utils/utils.dart';

class TittleWidget extends StatefulWidget {
  final String data;

  const TittleWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<TittleWidget> createState() => _TittleWidgetState();
}

class _TittleWidgetState extends State<TittleWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Text(
      widget.data,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16 * h,
        fontFamily: AppColor.fontFamilyPoppins,
        height: 24 / 16 * h,
        letterSpacing: 0.5 * w,
        color: AppColor.dark,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
