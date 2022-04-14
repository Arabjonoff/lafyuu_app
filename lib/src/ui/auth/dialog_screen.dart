import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/app_color/app_color.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Spacer(),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Exit"),
                    content: const Text("Are you exit now?"),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text("yes"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text("no"),
                      )
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 56,
              color: Colors.red,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("Exit"),
                    content: const Text("Are you exit now?"),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 32,
                          color: Colors.transparent,
                          child: const Center(
                            child: Text(
                              "yes",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: AppColor.fontFamily,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text("no"),
                      )
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 56,
              color: Colors.red,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Container(
                    height: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  );
                },
              );
            },
            child: Container(
              height: 56,
              color: Colors.red,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
