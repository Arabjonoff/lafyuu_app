import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/ui/menu/profile/birthday_screen.dart';
import 'package:lafyuu/src/ui/menu/profile/gender_screen.dart';
import 'package:lafyuu/src/ui/menu/profile/profile_item_screen.dart';
import 'package:lafyuu/src/ui/menu/profile/profile_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        primarySwatch: Colors.blue,
      ),
      home: ProfileItemScreen(),
    );
  }
}