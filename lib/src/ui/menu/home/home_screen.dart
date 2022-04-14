import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/bloc/category/category_bloc.dart';
import 'package:lafyuu/src/bloc/home/home_bloc.dart';
import 'package:lafyuu/src/model/all_category/category_model.dart';
import 'package:lafyuu/src/model/all_category/super_flash_model.dart';
import 'package:lafyuu/src/model/api/home_all_model.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/action_widget.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/search_widget.dart';
import 'package:lafyuu/src/widget/all_category/category_widget/home_category.dart';
import 'package:lafyuu/src/widget/all_category/product_widget/product_list_item_widget.dart';
import 'package:lafyuu/src/widget/all_category/product_widget/product_widget.dart';
import 'package:lafyuu/src/widget/all_category/stack_widget/home_product_stack_widget.dart';
import 'package:lafyuu/src/widget/all_category/stack_widget/home_stack_widget.dart';
import 'package:lafyuu/src/widget/shimmer_widget/category_shimmer/category_shimmer.dart';
import 'package:lafyuu/src/widget/shimmer_widget/sale_shimmer/flash_sale_shimmer.dart';
import 'package:lafyuu/src/widget/shimmer_widget/sale_shimmer/super_flash_sale_shimmer.dart';

import 'product_list/product_list_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(int index) onTap;

  const HomeScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SuperFlashModel? _superFlashModel;
  CategoryModel? _categoryModel;

  @override
  void initState() {
    categoryBloc.getSuperFlash();
    categoryBloc.allCategory();
    homeAllBloc.getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0.15 * h,
        title: const SearchWidget(),
        centerTitle: false,
        actions: const [
          ActionWidget(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(
          bottom: 16 * h,
        ),
        children: [
          StreamBuilder<SuperFlashModel>(
            stream: categoryBloc.superFlashData,
            builder: (context, snapshot) {
              if (snapshot.hasData || _superFlashModel != null) {
                if (snapshot.hasData) {
                  _superFlashModel = snapshot.data!;
                }
                return HomeStackWidget(
                  results: _superFlashModel!.results,
                );
              }
              return const SuperFlashSaleShimmer();
            },
          ),
          SizedBox(
            height: 24 * h,
          ),
          Row(
            children: [
              SizedBox(
                width: 16 * w,
              ),
              Expanded(
                child: Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 14 * h,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppColor.fontFamilyPoppins,
                    height: 21 / 14 * h,
                    letterSpacing: 0.5 * w,
                    color: AppColor.dark,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.onTap(1);
                },
                child: Text(
                  "More Category",
                  style: TextStyle(
                    fontSize: 14 * h,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppColor.fontFamilyPoppins,
                    height: 21 / 14 * h,
                    letterSpacing: 0.5 * w,
                    color: AppColor.blue,
                  ),
                ),
              ),
              SizedBox(
                width: 16 * w,
              ),
            ],
          ),
          StreamBuilder<CategoryModel>(
            stream: categoryBloc.categoryData,
            builder: (context, snapshot) {
              if (snapshot.hasData || _categoryModel != null) {
                if (snapshot.hasData) {
                  _categoryModel = snapshot.data!;
                }
                return HomeCategory(
                  results: _categoryModel!.results,
                );
              }
              return const CategoryShimmer();
            },
          ),
          StreamBuilder<HomeAllModel>(
            stream: homeAllBloc.allHomeData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                HomeAllModel data = snapshot.data!;
                return Column(
                  children: [
                    data.flashSale.results == 0
                        ? Container()
                        : Row(
                            children: [
                              SizedBox(
                                width: 16 * w,
                              ),
                              Expanded(
                                child: Text(
                                  "Flash Sale",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14 * h,
                                    fontFamily: AppColor.fontFamilyPoppins,
                                    letterSpacing: 0.5 * w,
                                    height: 21 / 14 * h,
                                    color: AppColor.dark,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return const ProductListScreen(
                                        type: 1,
                                      );
                                    }),
                                  );
                                },
                                child: Text(
                                  "See More",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14 * h,
                                    fontFamily: AppColor.fontFamilyPoppins,
                                    letterSpacing: 0.5 * w,
                                    height: 21 / 14 * h,
                                    color: AppColor.blue,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16 * w,
                              ),
                            ],
                          ),
                    data.flashSale.results == 0
                        ? Container()
                        : ProductListItemWidget(
                            type: 1,
                            results: data.flashSale.results,
                          ),
                    data.megaSale.results == 0
                        ? Container()
                        : Row(
                            children: [
                              SizedBox(
                                width: 16 * w,
                              ),
                              Expanded(
                                child: Text(
                                  "Mega Sale",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14 * h,
                                    fontFamily: AppColor.fontFamilyPoppins,
                                    letterSpacing: 0.5 * w,
                                    height: 21 / 14 * h,
                                    color: AppColor.dark,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return const ProductListScreen(
                                        type: 2,
                                      );
                                    }),
                                  );
                                },
                                child: Text(
                                  "See More",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14 * h,
                                    fontFamily: AppColor.fontFamilyPoppins,
                                    letterSpacing: 0.5 * w,
                                    height: 21 / 14 * h,
                                    color: AppColor.blue,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16 * w,
                              ),
                            ],
                          ),
                    data.megaSale.results == 0
                        ? Container()
                        : ProductListItemWidget(
                            type: 1,
                            results: data.megaSale.results,
                          ),
                    data.recoProductModel.results == 0
                        ? Container()
                        : HomeProductStackWidget(
                            results: data.recoProductModel.results,
                          ),
                    data.homeSale.results == 0
                        ? Container()
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  SizedBox(width: 16 * w),
                                  Expanded(
                                    child: ProductWidget(
                                      margin: EdgeInsets.only(
                                          right: 12 * w, bottom: 12 * h),
                                      data: data.homeSale.results[index * 2],
                                      height: 282 * h,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  44 * w) /
                                              2,
                                      star: true,
                                      trash: false,
                                      type: 1,
                                    ),
                                  ),
                                  Expanded(
                                    child: index * 2 + 1 >=
                                            data.homeSale.results.length
                                        ? Container()
                                        : ProductWidget(
                                            margin: EdgeInsets.only(
                                                right: 16 * w, bottom: 12 * h),
                                            data: data.homeSale
                                                .results[index * 2 + 1],
                                            height: 282 * h,
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    44 * w) /
                                                2,
                                            star: true,
                                            trash: false,
                                            type: 1,
                                          ),
                                  ),
                                ],
                              );
                            },
                            itemCount: (data.homeSale.results.length + 1) ~/ 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          )
                  ],
                );
              }
              return const FlashSaleShimmer();
            },
          )
        ],
      ),
    );
  }
}
