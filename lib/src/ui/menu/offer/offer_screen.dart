import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/bloc/category/category_bloc.dart';
import 'package:lafyuu/src/model/all_category/super_flash_model.dart';
import 'package:lafyuu/src/utils/utils.dart';
import 'package:lafyuu/src/widget/all_category/offer_widget/offer_widget.dart';
import 'package:lafyuu/src/widget/shimmer_widget/offer_shimmer/offer_shimmer.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  void initState() {
    categoryBloc.getSuperFlash();
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
        title: Text(
          "Offer",
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
          StreamBuilder<SuperFlashModel>(
            stream: categoryBloc.superFlashData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                SuperFlashModel data = snapshot.data!;
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(
                      bottom: 16 * h,
                      top: 16 * h,
                    ),
                    itemCount: data.results.length,
                    itemBuilder: (context, index) {
                      return OfferWidget(
                        data: data.results[index],
                      );
                    });
              }
              return const OfferShimmer();
            },
          ),
        ],
      ),
    );
  }
}
