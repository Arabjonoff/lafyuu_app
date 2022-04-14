import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/bloc/card/card_bloc.dart';
import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/cart/cart_widget.dart';
import 'package:lafyuu/src/widget/shimmer_widget/cart_shimmer/cart_screen_shimmer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    cardBloc.getCardBase();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0.15 * h,
        centerTitle: false,
        title: Text(
          "Your Cart",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16 * h,
            fontFamily: AppColor.fontFamilyPoppins,
            height: 24 / 16 * h,
            letterSpacing: 0.5 * w,
            color: AppColor.dark,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: StreamBuilder<List<ProductListResult>>(
          stream: cardBloc.cardDataBase,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductListResult> data = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: CartWidget(data: data),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      left: 16 * w,
                      right: 16 * w,
                      top: 16 * h,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.gray,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Total Price",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12 * h,
                              fontFamily: AppColor.fontFamilyPoppins,
                              height: 18 / 12 * h,
                              letterSpacing: 0.5 * w,
                              color: AppColor.dark,
                            ),
                          ),
                        ),
                        Text(
                          "\$766.86",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12 * h,
                            fontFamily: AppColor.fontFamilyPoppins,
                            height: 18 / 12 * h,
                            letterSpacing: 0.5 * w,
                            color: AppColor.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 57 * h,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      left: 16 * w,
                      right: 16 * w,
                      bottom: 16 * h,
                      top: 16 * h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.blue,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(
                            0,
                            10,
                          ),
                          blurRadius: 30,
                          color: AppColor.blue.withOpacity(0.24),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Check Out",
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
                ],
              );
            }
            return const CartScreenShimmer();
          }),
    );
  }
}
