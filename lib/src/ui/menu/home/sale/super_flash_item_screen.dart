import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/bloc/sale/super_sale_bloc.dart';
import 'package:lafyuu/src/model/all_category/super_flash_model.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/leading_widget.dart';
import 'package:lafyuu/src/widget/all_category/app_bar_widget/tittle_widget.dart';
import 'package:lafyuu/src/widget/all_category/product_widget/product_widget.dart';
import 'package:lafyuu/src/widget/all_category/stack_widget/super_sale_stack_widget.dart';
import 'package:lafyuu/src/widget/shimmer_widget/sale_shimmer/super_flash_item_shimmer.dart';

class SuperFlashItemScreen extends StatefulWidget {
  final String name;
  final int id;

  const SuperFlashItemScreen({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  _SuperFlashItemScreenState createState() => _SuperFlashItemScreenState();
}

class _SuperFlashItemScreenState extends State<SuperFlashItemScreen> {
  @override
  void initState() {
    superSaleBloc.getSuperSale(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0.15 * h,
        leading: const LeadingWidget(),
        title: TittleWidget(
          data: widget.name,
        ),
        centerTitle: false,
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: 16 * w,
            ),
            child: SvgPicture.asset("assets/icons/search_icon.svg"),
          ),
        ],
      ),
      body: StreamBuilder<SuperFlashResult>(
        stream: superSaleBloc.allSuperSale,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SuperFlashResult flashData = snapshot.data!;
            return ListView(
              children: [
                Container(
                  height: 206 * h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    top: 16 * h,
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  child: SuperSaleWidget(
                    item: flashData,
                  ),
                ),
                ListView.builder(
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
                            margin:
                                EdgeInsets.only(right: 12 * w, bottom: 12 * h),
                            data: flashData.product[index * 2],
                            height: 282 * h,
                            width:
                                (MediaQuery.of(context).size.width - 44 * w) /
                                    2,
                            star: true,
                            trash: false,
                            type: 5,
                          ),
                        ),
                        Expanded(
                          child: index * 2 + 1 >= flashData.product.length
                              ? Container()
                              : ProductWidget(
                                  margin: EdgeInsets.only(
                                      right: 16 * w, bottom: 12 * h),
                                  data: flashData.product[index * 2 + 1],
                                  height: 282 * h,
                                  width: (MediaQuery.of(context).size.width -
                                          44 * w) /
                                      2,
                                  star: true,
                                  trash: false,
                                  type: 5,
                                ),
                        ),
                      ],
                    );
                  },
                  itemCount: (flashData.product.length + 1) ~/ 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              ],
            );
          }
          return const SuperFlashItemShimmer();
        },
      ),
    );
  }
}
