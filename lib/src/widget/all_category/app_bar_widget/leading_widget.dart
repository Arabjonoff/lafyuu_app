import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeadingWidget extends StatelessWidget {
  const LeadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: SvgPicture.asset("assets/icons/back.svg"),
        ),
      ),
    );
  }
}
