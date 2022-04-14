import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/bloc/favourite/favourite_bloc.dart';
import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/leading_widget.dart';
import 'package:lafyuu/src/widget/all_category/product_widget/product_widget.dart';
import 'package:lafyuu/src/widget/shimmer_widget/product_screen/favorite_product_shimmer.dart';
class FavoriteProductScreen extends StatefulWidget {
  const FavoriteProductScreen({Key? key}) : super(key: key);

  @override
  _FavoriteProductScreenState createState() => _FavoriteProductScreenState();
}

class _FavoriteProductScreenState extends State<FavoriteProductScreen> {
  @override
  void initState() {
    favouriteBloc.allFavourite();
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
        leading: const LeadingWidget(),
        title: Text(
          "Favorite Product",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16 * h,
            fontFamily: AppColor.fontFamilyPoppins,
            height: 24 / 16 * h,
            letterSpacing: 0.5 * w,
            color: AppColor.dark,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          StreamBuilder<List<ProductListResult>>(
            stream: favouriteBloc.getFavourite,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductListResult> data = snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.only(
                    top: 16 * h,
                    bottom: 16 * h,
                  ),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(
                          width: 16 * w,
                        ),
                        Expanded(
                          child: ProductWidget(
                            data: data[index * 2],
                            margin: EdgeInsets.only(
                              right: 12 * w,
                              bottom: 12 * h,
                            ),
                            height: 296 * h,
                            width:
                                (MediaQuery.of(context).size.width - 44 * w) /
                                    2,
                            star: true,
                            trash: true,
                            type: 3,
                          ),
                        ),
                        Expanded(
                          child: index * 2 + 1 >= data.length
                              ? Container()
                              : ProductWidget(
                                  data: data[index * 2 + 1],
                                  margin: EdgeInsets.only(
                                    right: 16 * w,
                                    bottom: 12 * h,
                                  ),
                                  height: 296 * h,
                                  width: (MediaQuery.of(context).size.width -
                                          44 * w) /
                                      2,
                                  star: true,
                                  trash: true,
                                  type: 3,
                                ),
                        ),
                      ],
                    );
                  },
                  itemCount: (data.length + 1) ~/ 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                );
              }
              return const FavoriteProductShimmer();
            },
          ),
        ],
      ),
    );
  }
}
