import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/model/api/recomended_product_model.dart';
import 'package:lafyuu/src/utils/utils.dart';

class HomeProductStackWidget extends StatefulWidget {
  final List<RecoProductResult> results;

  const HomeProductStackWidget({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  State<HomeProductStackWidget> createState() => _HomeProductStackWidgetState();
}

class _HomeProductStackWidgetState extends State<HomeProductStackWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Column(
      children: [
        Container(
          height: 206 * h,
          margin: EdgeInsets.only(
            bottom: 16 * h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: CarouselSlider(
            items: widget.results.map((item) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      item.image,
                      height: 206 * h,
                      width: MediaQuery.of(context).size.width * 0.9,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 48 * h,
                        left: 40 * w,
                      ),
                      padding: EdgeInsets.only(
                        right: 56 * w,
                      ),
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24 * h,
                          fontFamily: AppColor.fontFamilyPoppins,
                          height: 36 / 24 * h,
                          letterSpacing: 0.5 * w,
                          color: AppColor.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 136 * h,
                        left: 40 * w,
                      ),
                      child: Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12 * h,
                          fontFamily: AppColor.fontFamilyPoppins,
                          height: 22 / 12 * h,
                          letterSpacing: 0.5 * w,
                          color: AppColor.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
            options: CarouselOptions(
              onPageChanged: (_index, _reason) {
                setState(() {
                  _selectedIndex = _index;
                });
              },
              height: 206 * h,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }
}
