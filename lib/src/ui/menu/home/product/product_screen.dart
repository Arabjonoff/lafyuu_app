import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/bloc/product/product_bloc.dart';
import 'package:lafyuu/src/model/api/product_item_model.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/leading_widget.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/tittle_widget.dart';
import 'package:lafyuu/src/widget/all_category/product_widget/product_list_item_widget.dart';
import 'package:lafyuu/src/widget/shimmer_widget/product_screen/product_screen_shimmer.dart';
import 'package:lafyuu/src/widget/star_widget/star_widget.dart';

class ProductScreen extends StatefulWidget {
  final int id;

  const ProductScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    productBloc.getProductItem(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return StreamBuilder<ProductItemModel>(
      stream: productBloc.productItemData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ProductItemModel productItemData = snapshot.data!;
          return Scaffold(
            backgroundColor: AppColor.white,
            appBar: AppBar(
              backgroundColor: AppColor.white,
              elevation: 0.15 * h,
              leading: const LeadingWidget(),
              centerTitle: false,
              title: TittleWidget(
                data: productItemData.category,
              ),
              actions: [
                SvgPicture.asset("assets/icons/search_icon.svg"),
                SizedBox(
                  width: 16 * w,
                ),
                SvgPicture.asset("assets/icons/more.svg"),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 238 * h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            onPageChanged: (_index, _reason) {
                              setState(() {
                                _selectedIndex = _index;
                              });
                            },
                            height: 238 * h,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.easeInOut,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: productItemData.images.map((item) {
                            return Image.network(
                              item.image,
                              height: 238 * h,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                      SizedBox(
                        height: 8 * h,
                        child: Center(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 8 * h,
                                width: 8 * h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: index == _selectedIndex
                                      ? AppColor.blue
                                      : AppColor.gray,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                              );
                            },
                            itemCount: productItemData.images.length,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 16 * w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16 * h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    productItemData.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20 * h,
                                      fontFamily: AppColor.fontFamilyPoppins,
                                      height: 30 / 20 * h,
                                      letterSpacing: 0.5 * w,
                                      color: AppColor.dark,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    productBloc.updateFav(productItemData);
                                  },
                                  child: SizedBox(
                                    height: 36 * h,
                                    width: 36 * h,
                                    child: Center(
                                        child: productItemData.isFav
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : const Icon(
                                                Icons.favorite_border,
                                                color: Colors.grey,
                                              )),
                                  ),
                                ),
                                SizedBox(
                                  width: 16 * w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8 * h,
                            ),
                            StarWidget(
                              reviewAvg: productItemData.reviewAvg,
                              size: 16 * h,
                            ),
                            SizedBox(
                              height: 16 * h,
                            ),
                            Text(
                              "\$" + productItemData.price.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20 * h,
                                fontFamily: AppColor.fontFamilyPoppins,
                                height: 30 / 20 * h,
                                letterSpacing: 0.5 * w,
                                color: AppColor.blue,
                              ),
                            ),
                            SizedBox(
                              height: 24 * h,
                            ),
                            productItemData.size.isEmpty
                                ? Container()
                                : Text(
                                    "Select Size",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14 * h,
                                      fontFamily: AppColor.fontFamilyPoppins,
                                      height: 21 / 14 * h,
                                      letterSpacing: 0.5 * w,
                                      color: AppColor.dark,
                                    ),
                                  ),
                            productItemData.size.isEmpty
                                ? Container()
                                : SizedBox(
                                    height: 84 * h,
                                    child: ListView.builder(
                                        itemCount: productItemData.size.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: 48 * h,
                                            margin: EdgeInsets.only(
                                              right: 16 * w,
                                            ),
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (productItemData.size[index].selected == index) {
                                                    productItemData.size[index].selected = -1;
                                                  } else {
                                                    for (int i = 0; i < productItemData.size.length; i++) {
                                                      productItemData.size[i].selected = -1;
                                                    }
                                                    productItemData.size[index].selected = index;
                                                  }
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: 48 * h,
                                                  width: 48 * h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                    border: Border.all(
                                                      color: index == productItemData.size[index].selected
                                                          ? AppColor.blue
                                                          : AppColor.gray,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      productItemData
                                                          .size[index].size,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14 * h,
                                                        fontFamily: AppColor
                                                            .fontFamilyPoppins,
                                                        height: 21 / 14 * h,
                                                        letterSpacing: 0.5 * w,
                                                        color: AppColor.dark,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                            productItemData.color.isEmpty
                                ? Container()
                                : Text(
                                    "Select Color",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14 * h,
                                      fontFamily: AppColor.fontFamilyPoppins,
                                      height: 21 / 14 * h,
                                      letterSpacing: 0.5 * w,
                                      color: AppColor.dark,
                                    ),
                                  ),
                            productItemData.color.isEmpty
                                ? Container()
                                : SizedBox(
                                    height: 84 * h,
                                    child: ListView.builder(
                                        itemCount: productItemData.color.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: 48 * h,
                                            margin: EdgeInsets.only(
                                              right: 16 * w,
                                            ),
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (productItemData
                                                      .color[index].selected) {
                                                    productItemData.color[index]
                                                        .selected = false;
                                                  } else {
                                                    for (int i = 0;
                                                        i <
                                                            productItemData
                                                                .color.length;
                                                        i++) {
                                                      productItemData.color[i]
                                                          .selected = false;
                                                    }
                                                    productItemData.color[index]
                                                        .selected = true;
                                                  }
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: 48 * h,
                                                  width: 48 * h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                    border: Border.all(
                                                      color: productItemData
                                                                  .color[index]
                                                                  .color
                                                                  .toUpperCase() ==
                                                              "FFFFFF"
                                                          ? AppColor.grey
                                                          : HexColor.fromHex(
                                                              productItemData
                                                                  .color[index]
                                                                  .color,
                                                            ),
                                                    ),
                                                    color: HexColor.fromHex(
                                                      productItemData
                                                          .color[index].color,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Container(
                                                      width: 16 * h,
                                                      height: 16 * h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: productItemData
                                                                .color[index]
                                                                .selected
                                                            ? productItemData
                                                                        .color[
                                                                            index]
                                                                        .color
                                                                        .toUpperCase() ==
                                                                    "FFFFFF"
                                                                ? Colors.black
                                                                : AppColor.white
                                                            : productItemData
                                                                        .color[
                                                                            index]
                                                                        .color
                                                                        .toUpperCase() ==
                                                                    "FFFFFF"
                                                                ? Colors
                                                                    .transparent
                                                                : Colors
                                                                    .transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                            productItemData.specification.isEmpty
                                ? Container()
                                : Text(
                                    "Specification",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14 * h,
                                      fontFamily: AppColor.fontFamilyPoppins,
                                      height: 21 / 14 * h,
                                      letterSpacing: 0.5 * w,
                                      color: AppColor.dark,
                                    ),
                                  ),
                            productItemData.specification.isEmpty
                                ? Container()
                                : ListView.builder(
                                    padding: EdgeInsets.only(
                                      top: 12 * h,
                                      bottom: 16 * h,
                                    ),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Shown:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12 * h,
                                                    fontFamily: AppColor
                                                        .fontFamilyPoppins,
                                                    height: 22 / 12 * h,
                                                    letterSpacing: 0.5 * w,
                                                    color: AppColor.dark,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                productItemData
                                                    .specification[index].shown,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12 * h,
                                                  fontFamily: AppColor
                                                      .fontFamilyPoppins,
                                                  height: 22 / 12 * h,
                                                  letterSpacing: 0.5 * w,
                                                  color: AppColor.grey,
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
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Style:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12 * h,
                                                    fontFamily: AppColor
                                                        .fontFamilyPoppins,
                                                    height: 22 / 12 * h,
                                                    letterSpacing: 0.5 * w,
                                                    color: AppColor.dark,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                productItemData
                                                    .specification[index].style,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12 * h,
                                                  fontFamily: AppColor
                                                      .fontFamilyPoppins,
                                                  height: 22 / 12 * h,
                                                  letterSpacing: 0.5 * w,
                                                  color: AppColor.grey,
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
                                          Container(
                                            padding: EdgeInsets.only(
                                              right: 16 * w,
                                            ),
                                            child: Text(
                                              productItemData
                                                  .specification[index]
                                                  .textmodels,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12 * h,
                                                fontFamily:
                                                    AppColor.fontFamilyPoppins,
                                                height: 22 / 12 * h,
                                                letterSpacing: 0.5 * w,
                                                color: AppColor.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    itemCount:
                                        productItemData.specification.length,
                                  ),
                            productItemData.reviewAvg.toString().isEmpty
                                ? const Text("")
                                : Container(
                                    margin: EdgeInsets.only(
                                      bottom: 8 * h,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Review Product",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14 * h,
                                              fontFamily:
                                                  AppColor.fontFamilyPoppins,
                                              height: 21 / 14 * h,
                                              letterSpacing: 0.5 * w,
                                              color: AppColor.dark,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "See More",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14 * h,
                                            fontFamily:
                                                AppColor.fontFamilyPoppins,
                                            height: 21 / 14 * h,
                                            letterSpacing: 0.5 * w,
                                            color: AppColor.blue,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16 * w,
                                        ),
                                      ],
                                    ),
                                  ),
                            productItemData.reviewAvg.toString().isEmpty
                                ? Container()
                                : Container(
                                    margin: EdgeInsets.only(
                                      bottom: 16 * h,
                                    ),
                                    child: Row(
                                      children: [
                                        StarWidget(
                                          reviewAvg: productItemData.reviewAvg,
                                          size: 16 * h,
                                        ),
                                        SizedBox(
                                          width: 8 * w,
                                        ),
                                        Text(
                                          productItemData.reviewAvg.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10 * h,
                                            fontFamily:
                                                AppColor.fontFamilyPoppins,
                                            height: 15 / 10 * h,
                                            letterSpacing: 0.5,
                                            color: AppColor.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3 * w,
                                        ),
                                        Text(
                                          "(" +
                                              productItemData.reviewCount
                                                  .toString() +
                                              " Review)",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10 * h,
                                            fontFamily:
                                                AppColor.fontFamilyPoppins,
                                            height: 15 / 10 * h,
                                            letterSpacing: 0.5,
                                            color: AppColor.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            productItemData.review.user.firstName == "" &&
                                    productItemData.review.user.lastName == ""
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 48 * h,
                                            width: 48 * h,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              child: CachedNetworkImage(
                                                imageUrl: productItemData
                                                    .review.user.avatar,
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator
                                                        .adaptive(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16 * w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                productItemData
                                                        .review.user.firstName +
                                                    productItemData
                                                        .review.user.lastName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14 * h,
                                                  fontFamily: AppColor
                                                      .fontFamilyPoppins,
                                                  height: 21 / 14 * h,
                                                  letterSpacing: 0.5 * w,
                                                  color: AppColor.dark,
                                                ),
                                              ),
                                              StarWidget(
                                                reviewAvg: productItemData
                                                    .review.start
                                                    .toDouble(),
                                                size: 16,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16 * h,
                                      ),
                                      Text(
                                        productItemData.review.text,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12 * h,
                                          fontFamily:
                                              AppColor.fontFamilyPoppins,
                                          height: 21 / 12 * h,
                                          letterSpacing: 0.5,
                                          color: AppColor.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16 * h,
                                      ),
                                      productItemData.review.images.isEmpty
                                          ? Container()
                                          : Container(
                                              height: 72 * h,
                                              margin: EdgeInsets.only(
                                                bottom: 16 * h,
                                              ),
                                              child: ListView.builder(
                                                  itemCount: productItemData
                                                      .review.images.length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      width: 72 * h,
                                                      margin: EdgeInsets.only(
                                                        right: 12 * w,
                                                      ),
                                                      child: Container(
                                                        height: 72 * h,
                                                        width: 72 * h,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                productItemData
                                                                    .review
                                                                    .images[
                                                                        index]
                                                                    .image,
                                                            placeholder: (context,
                                                                    url) =>
                                                                const CircularProgressIndicator
                                                                    .adaptive(),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                const Icon(Icons
                                                                    .error),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                      productItemData.review.date
                                              .toString()
                                              .isEmpty
                                          ? const Text("")
                                          : Container(
                                              margin: EdgeInsets.only(
                                                bottom: 23 * h,
                                              ),
                                              child: Text(
                                                  DateFormat('yyyy.dd.MMMM')
                                                      .format(
                                                productItemData.review.date,
                                              )
                                                  // Utils.getDateFormat(productItemData.review.date),
                                                  ),
                                            ),
                                    ],
                                  ),
                            productItemData.products.isEmpty
                                ? Container()
                                : Text(
                                    "You Might Also Like",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14 * h,
                                      fontFamily: AppColor.fontFamilyPoppins,
                                      height: 21 / 14 * h,
                                      letterSpacing: 0.5 * w,
                                      color: AppColor.dark,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      productItemData.products.isEmpty
                          ? Container()
                          : ProductListItemWidget(
                              type: 4,
                              results: productItemData.products,
                            ),
                    ],
                  ),
                ),
                productItemData.cardCount == 0
                    ? GestureDetector(
                        onTap: () {
                          productBloc.updateCard(productItemData, false);
                        },
                        child: Container(
                          height: 56 * h,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                            left: 16 * w,
                            right: 16 * w,
                            bottom: 16 * h,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(
                                  0,
                                  10,
                                ),
                                color: AppColor.blue.withOpacity(0.24),
                                blurRadius: 30,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.blue,
                          ),
                          child: Center(
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14 * h,
                                fontFamily: AppColor.fontFamilyPoppins,
                                height: 25 / 14 * h,
                                letterSpacing: 0.5 * w,
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
                              productBloc.updateCard(productItemData, true);
                            },
                            child: Container(
                              height: 56 * h,
                              width: 56 * h,
                              margin: EdgeInsets.only(
                                left: 16 * w,
                                bottom: 16 * h,
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
                                productItemData.cardCount.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * h,
                                  fontFamily: AppColor.fontFamilyPoppins,
                                  letterSpacing: 0.5 * w,
                                  color: AppColor.dark,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              productBloc.updateCard(productItemData, false);
                            },
                            child: Container(
                              height: 56 * h,
                              width: 56 * h,
                              margin: EdgeInsets.only(
                                right: 16 * w,
                                bottom: 16 * h,
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
                      )
              ],
            ),
          );
        }
        return const ProductScreenShimmer();
      },
    );
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
