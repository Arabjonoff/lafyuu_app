import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/ui/menu/home/favourite/favorite_product_screen.dart';
import 'package:lafyuu/src/utils/utils.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const FavoriteProductScreen();
            }),);
          },
          child: Container(
            height: 24 * h,
            width: 24 * h,
            margin: EdgeInsets.only(
              right: 16 * w,
            ),
            child: SvgPicture.asset("assets/icons/love.svg"),
          ),
        ),
        Container(
          height: 24 * h,
          width: 24 * h,
          margin: EdgeInsets.only(
            right: 16 * w,
          ),
          child: SvgPicture.asset("assets/icons/qongiroq.svg"),
        ),
      ],
    );
  }
}
