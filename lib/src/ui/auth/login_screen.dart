// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:lesson_widget/src/ui/home/home_screen.dart';
// import 'package:lesson_widget/src/ui/auth/register_form.dart';
// import 'package:lesson_widget/src/app_color/app_color.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   final TextEditingController _controller1 = TextEditingController();
//   final TextEditingController _controller2 = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: ListView(
//         children: [
//           Row(
//             children: [
//               Spacer(),
//               Container(
//                 width: 72,
//                 height: 72,
//                 margin: EdgeInsets.only(
//                   top: 112,
//                   bottom: 16,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Color(0xFF40BFFF),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Center(
//                   child: SvgPicture.asset(
//                     "assets/icons/vector.svg",
//                   ),
//                 ),
//               ),
//               Spacer(),
//             ],
//           ),
//           Column(
//             children: [
//               Text(
//                 "Welcome to Lafyuu",
//                 style: TextStyle(
//                   fontFamily: AppColor.fontFamilyPoppins,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                   color: Color(0xFF223263),
//                   height: 1.5,
//                   letterSpacing: 0.5,
//                 ),
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 "Sign in to continue",
//                 style: TextStyle(
//                   fontFamily: AppColor.fontFamilyPoppins,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12,
//                   letterSpacing: 0.5,
//                   height: 1.8,
//                   color: Color(0xFF9098B1),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             width: w,
//             height: 48,
//             margin: EdgeInsets.only(
//               top: 28,
//               left: 16,
//               right: 16,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(
//                 color: Color(0xFFEBF0FF),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(
//                     left: 16,
//                     right: 10,
//                   ),
//                   child: SvgPicture.asset("assets/icons/message.svg"),
//                 ),
//                 Expanded(
//                   child: TextField(
//                     controller: _controller1,
//                     style: TextStyle(
//                       fontFamily: AppColor.fontFamilyPoppins,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF9098B1),
//                     ),
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Your Email",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: w,
//             height: 48,
//             margin: EdgeInsets.only(
//               top: 8,
//               left: 16,
//               right: 16,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(
//                 color: Color(0xFFEBF0FF),
//               ),
//             ),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 16,
//                 ),
//                 SvgPicture.asset("assets/icons/password.svg"),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: TextField(
//                     controller: _controller2,
//                     style: TextStyle(
//                       fontFamily: AppColor.fontFamilyPoppins,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF9098B1),
//                     ),
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Password",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) {
//                   return HomeScreen();
//                 }),
//               );
//             },
//             child: GestureDetector(
//               onTap: () {
//                 _getData();
//               },
//               child: Container(
//                 width: w,
//                 height: 57,
//                 margin: EdgeInsets.only(
//                   top: 16,
//                   left: 16,
//                   right: 16,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Color(0xFF40BFFF),
//                   borderRadius: BorderRadius.circular(5),
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 30,
//                       spreadRadius: 0,
//                       offset: Offset(15, 10),
//                       color: Color(0xFF40BFFF).withOpacity(0.24),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Center(
//                         child: Text(
//                           "Sign In",
//                           style: TextStyle(
//                             fontFamily: AppColor.fontFamilyPoppins,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 14,
//                             letterSpacing: 0.5,
//                             height: 1.8,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 21,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 16,
//               ),
//               Container(
//                 width: 134,
//                 height: 1,
//                 decoration: BoxDecoration(
//                   color: Color(0xFFEBF0FF),
//                 ),
//               ),
//               Spacer(),
//               Text(
//                 "OR",
//                 style: TextStyle(
//                   fontFamily: AppColor.fontFamilyPoppins,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w700,
//                   letterSpacing: 0.5,
//                   height: 1.5,
//                   color: Color(0xFF9098B1),
//                 ),
//               ),
//               Spacer(),
//               Container(
//                 width: 134,
//                 height: 1,
//                 decoration: BoxDecoration(
//                   color: Color(0xFFEBF0FF),
//                 ),
//               ),
//               SizedBox(
//                 width: 16,
//               ),
//             ],
//           ),
//           Container(
//             width: w,
//             height: 57,
//             margin: EdgeInsets.only(
//               top: 16,
//               left: 16,
//               right: 16,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(
//                 color: Color(0xFFEBF0FF),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 24,
//                   height: 24,
//                   margin: EdgeInsets.only(
//                     left: 16,
//                   ),
//                   child: Image.asset(
//                     "assets/images/google.png",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Expanded(
//                   child: Center(
//                     child: Text(
//                       "Login with Google",
//                       style: TextStyle(
//                         fontFamily: AppColor.fontFamilyPoppins,
//                         fontWeight: FontWeight.w700,
//                         fontSize: 14,
//                         height: 1.8,
//                         letterSpacing: 0.5,
//                         color: Color(0xFF9098B1),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 24,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: w,
//             height: 57,
//             margin: EdgeInsets.only(
//               top: 8,
//               left: 16,
//               right: 16,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(
//                 color: Color(0xFFEBF0FF),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 24,
//                   height: 24,
//                   margin: EdgeInsets.only(
//                     left: 16,
//                   ),
//                   child: Image.asset(
//                     "assets/images/facebook.png",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Expanded(
//                   child: Center(
//                     child: Text(
//                       "Login with facebook",
//                       style: TextStyle(
//                         fontFamily: AppColor.fontFamilyPoppins,
//                         fontWeight: FontWeight.w700,
//                         fontSize: 14,
//                         height: 1.8,
//                         letterSpacing: 0.5,
//                         color: Color(0xFF9098B1),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 24,),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 16,
//           ),
//           Column(
//             children: [
//               Text(
//                 "Forgot Password?",
//                 style: TextStyle(
//                   fontFamily: AppColor.fontFamilyPoppins,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w700,
//                   fontStyle: FontStyle.normal,
//                   color: Color(0xFF40BFFF),
//                 ),
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Don’t have a account? ",
//                     style: TextStyle(
//                       fontFamily: AppColor.fontFamilyPoppins,
//                       fontStyle: FontStyle.normal,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12,
//                       color: Color(0xFF9098B1),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) {
//                           return RegisterFrom();
//                         }),
//                       );
//                     },
//                     child: Text(
//                       "Register",
//                       style: TextStyle(
//                         fontFamily: AppColor.fontFamilyPoppins,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w700,
//                         fontStyle: FontStyle.normal,
//                         color: Color(0xFF40BFFF),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _getData() async {
//     SharedPreferences prep = await SharedPreferences.getInstance();
//     String mail = prep.getString("email") ?? "";
//     String pass = prep.getString("password") ?? "";
//     print(mail);
//     print(pass);
//     if (_controller1.text == mail && _controller2.text == pass) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) {
//           return HomeScreen();
//         }),
//       );
//     }
//   }
// }
