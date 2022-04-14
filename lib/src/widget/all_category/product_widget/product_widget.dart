import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/bloc/home/home_bloc.dart';
import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/ui/menu/home/product/product_screen.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/star_widget/star_widget.dart';

class ProductWidget extends StatelessWidget {
  final ProductListResult data;
  final EdgeInsets margin;
  final double height;
  final double width;
  final bool star;
  final bool trash;
  final int type;

  const ProductWidget({
    Key? key,
    required this.data,
    required this.margin,
    required this.height,
    required this.width,
    this.star = false,
    this.trash = false,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return GestureDetector(
      onTap: () {
        if (type == 4) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductScreen(
                  id: data.id,
                );
              },
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductScreen(
                  id: data.id,
                );
              },
            ),
          );
        }
      },
      child: Container(
        width: width,
        margin: margin,
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              padding: EdgeInsets.only(
                top: 16 * h,
                left: 16 * w,
                right: 16 * w,
                bottom: 16 * h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.gray,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: data.images.image,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator.adaptive(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          height: width - 32 * w,
                          width: width - 32 * w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            if (type != 3) {
                              homeAllBloc.updateFav(data, type);
                            }
                          },
                          child: SizedBox(
                            height: 36 * h,
                            width: 36 * h,
                            child: Center(
                              child: data.isFav
                                  ? const Icon(
                                      Icons.favorite,
                                      color: AppColor.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: AppColor.grey,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8 * h,
                  ),
                  Text(
                    data.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 18 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.dark,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4 * h,
                  ),
                  star
                      ? StarWidget(
                          size: 12 * h,
                          reviewAvg: data.reviewAvg,
                        )
                      : Container(),
                  const Spacer(),
                  Text(
                    "\$" + data.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12 * h,
                      fontFamily: AppColor.fontFamilyPoppins,
                      height: 22 / 12 * h,
                      letterSpacing: 0.5 * w,
                      color: AppColor.blue,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          "\$" + data.discountPrice.toString(),
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w400,
                            fontSize: 10 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            height: 15 / 10 * h,
                            letterSpacing: 0.5 * w,
                            color: AppColor.grey,
                          ),
                        ),
                      ),
                      Text(
                        "24% Off",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 10 * h,
                          fontFamily: AppColor.fontFamilyPoppins,
                          height: 15 / 10 * h,
                          letterSpacing: 0.5 * w,
                          color: AppColor.red,
                        ),
                      ),
                      SizedBox(
                        width: 12 * w,
                      ),
                      trash
                          ? GestureDetector(
                              onTap: () {
                                homeAllBloc.updateFav(data, type);
                              },
                              child: SizedBox(
                                height: 31 * h,
                                width: 31 * h,
                                child: Center(
                                    child: SvgPicture.asset(
                                        "assets/icons/trash.svg")),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
            data.card == 0
                ? GestureDetector(
                    onTap: () {
                      homeAllBloc.updateCard(data, false, type);
                    },
                    child: Container(
                      height: 24 * h,
                      width: width,
                      margin: EdgeInsets.only(
                        top: 8 * h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Add to Card",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            letterSpacing: 0.5 * w,
                            height: 25 / 12 * h,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  )
                : Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          homeAllBloc.updateCard(data, true, type);
                        },
                        child: Container(
                          height: 24 * h,
                          width: 24 * h,
                          margin: EdgeInsets.only(
                            top: 8 * h,
                          ),
                          child: Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12 * h,
                                fontFamily: AppColor.fontFamilyPoppins,
                                letterSpacing: 0.5 * w,
                                height: 25 / 12 * h,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            data.card.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12 * h,
                              fontFamily: AppColor.fontFamilyPoppins,
                              letterSpacing: 0.5 * w,
                              height: 18 / 6 * h,
                              color: AppColor.dark,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          homeAllBloc.updateCard(data, false, type);
                        },
                        child: Container(
                          height: 24 * h,
                          width: 24 * h,
                          margin: EdgeInsets.only(
                            top: 8 * h,
                          ),
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12 * h,
                                fontFamily: AppColor.fontFamilyPoppins,
                                letterSpacing: 0.5 * w,
                                height: 25 / 12 * h,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
