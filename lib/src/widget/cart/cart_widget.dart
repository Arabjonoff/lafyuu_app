import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/bloc/card/card_bloc.dart';
import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/utils/utils.dart';

class CartWidget extends StatelessWidget {
  final List<ProductListResult> data;

  const CartWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return ListView.builder(
      padding: EdgeInsets.only(
        top: 16 * h,
      ),
      itemBuilder: (context, index) {
        return Container(
          height: 104 * h,
          margin: EdgeInsets.only(
            bottom: 16 * h,
            left: 16 * w,
            right: 16 * w,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.gray,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 16 * w,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: data[index].images.image,
                  height: 72 * h,
                  width: 72 * h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator.adaptive(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16 * h,
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 12 * w,
                          ),
                          Expanded(
                            child: Text(
                              data[index].name,
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
                          ),
                          GestureDetector(
                            onTap: () {
                              cardBloc.updateFav(data[index]);
                            },
                            child: SizedBox(
                              height: 32 * h,
                              width: 32 * h,
                              child: Center(
                                child: data[index].isFav
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
                          SizedBox(
                            width: 8 * w,
                          ),
                          GestureDetector(
                            onTap: () {
                              cardBloc.delete(data[index].id,true);
                            },
                            child: SizedBox(
                              height: 32 * h,
                              width: 32 * h,
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/trash.svg",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16 * w,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 12 * w,
                        ),
                        Expanded(
                          child: Text(
                            "\$" +
                                (data[index].price * data[index].card)
                                    .toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12 * h,
                              fontFamily: AppColor.fontFamilyPoppins,
                              height: 18 / 12 * h,
                              letterSpacing: 0.5 * w,
                              color: AppColor.blue,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            cardBloc.updateCard(data[index], true);
                          },
                          child: Container(
                            height: 24 * h,
                            width: 32 * w,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                              border: Border.all(
                                color: AppColor.gray,
                              ),
                              color: data[index].card == 1
                                  ? Colors.black12
                                  : AppColor.white,
                            ),
                            child: Center(
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/minus.svg",
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 24 * h,
                          width: 40 * w,
                          color: AppColor.gray,
                          child: Center(
                            child: Text(
                              data[index].card.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12 * h,
                                fontFamily: AppColor.fontFamilyPoppins,
                                height: 18 / 12 * h,
                                letterSpacing: 0.5 * w,
                                color: AppColor.dark,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            cardBloc.updateCard(data[index], false);
                          },
                          child: Container(
                            height: 24 * h,
                            width: 32 * w,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              border: Border.all(
                                color: AppColor.gray,
                              ),
                            ),
                            child: Center(
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/plus.svg",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16 * w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16 * h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: data.length,
    );
  }
}
