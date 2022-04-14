import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lafyuu/src/app_color/app_color.dart';
import 'package:lafyuu/src/model/all_category/super_flash_model.dart';
import 'package:lafyuu/src/ui/menu/home/sale/super_flash_item_screen.dart';
import 'package:lafyuu/src/utils/utils.dart';

import 'super_sale_stack_widget.dart';

class HomeStackWidget extends StatefulWidget {
  final List<SuperFlashResult> results;

  const HomeStackWidget({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  State<HomeStackWidget> createState() => _HomeStackWidgetState();
}

class _HomeStackWidgetState extends State<HomeStackWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 206 * h,
          margin: EdgeInsets.only(
            top: 16 * h,
          ),
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
              height: 206 * h,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: widget.results.map((item) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SuperFlashItemScreen(
                        name: item.name,
                        id: item.id,
                      );
                    }),
                  );
                },
                child: SuperSaleWidget(item: item,),
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
                    color:
                        index == _selectedIndex ? AppColor.blue : AppColor.gray,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                );
              },
              itemCount: widget.results.length,
            ),
          ),
        ),
      ],
    );
  }
}
