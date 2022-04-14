import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/bloc/product/product_list_bloc.dart';
import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/leading_widget.dart';
import 'package:lafyuu/src/widget/all_category/product_widget/product_widget.dart';
import 'package:lafyuu/src/widget/shimmer_widget/sale_shimmer/sale_item_screen_shimmer.dart';
class ProductListScreen extends StatefulWidget {
  final int type;

  const ProductListScreen({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    productListBloc.getData(widget.type);
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
        leading: const LeadingWidget(),
        elevation: 0.15 * h,
        title: Text(
          widget.type == 1 ? "FlashSale" : "MegaSale",
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
          StreamBuilder<ProductListModel>(
              stream: productListBloc.allProduct,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  ProductListModel data = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.only(
                      top: 16 * h,
                      bottom: 16 * h,
                    ),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(width: 16 * w),
                          Expanded(
                            child: ProductWidget(
                              margin: EdgeInsets.only(
                                right: 12 * w,
                                bottom: 12 * h,
                              ),
                              data: data.results[index * 2],
                              height: 296 * h,
                              width:
                                  (MediaQuery.of(context).size.width - 44 * w) /
                                      2,
                              star: true,
                              trash: false,
                              type: 2,
                            ),
                          ),
                          Expanded(
                            child: index * 2 + 1 >= data.results.length
                                ? Container()
                                : ProductWidget(
                                    margin: EdgeInsets.only(
                                        right: 16 * w, bottom: 12 * h),
                                    data: data.results[index * 2 + 1],
                                    height: 296 * h,
                                    width: (MediaQuery.of(context).size.width -
                                            44 * w) /
                                        2,
                                    star: true,
                                    trash: false,
                                    type: 2,
                                  ),
                          ),
                        ],
                      );
                    },
                    itemCount: (data.results.length + 1) ~/ 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  );
                }
                return const SaleItemScreenShimmer();
              }),
        ],
      ),
    );
  }
}
