// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:lesson_widget/src/app_color/app_color.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'login_filled2.dart';
//
// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _SignUpState();
//   }
// }
//
// class _SignUpState extends State<SignUp> {
//   bool isHiddenPassword = true;
//
//   String a = "";
//   String b = "";
//   String c = "";
//
//   final TextEditingController _controller = TextEditingController();
//   final TextEditingController _controller1 = TextEditingController();
//   final TextEditingController _controller2 = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 68,
//           ),
//           Center(
//             child: Container(
//               width: 64,
//               height: 64,
//               decoration: BoxDecoration(
//                 color: Color(0xFF327FEB),
//                 borderRadius: BorderRadius.circular(9),
//               ),
//               child: Center(
//                 child: SvgPicture.asset("assets/icons/z.svg"),
//               ),
//             ),
//           ),
//           Container(
//             width: 243,
//             height: 73,
//             margin: EdgeInsets.only(
//               top: 20,
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 57,
//                   height: 27,
//                   margin: EdgeInsets.only(
//                     top: 19,
//                     left: 28,
//                     bottom: 27,
//                   ),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) {
//                           return LoginFilled2();
//                         }),
//                       );
//                     },
//                     child: Text(
//                       "Log In",
//                       style: TextStyle(
//                         fontFamily: AppColor.fontFamily,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFFA9A9A9),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 74,
//                   height: 33,
//                   margin: EdgeInsets.only(
//                     top: 20,
//                     left: 47,
//                     bottom: 20,
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Sign Up",
//                         style: TextStyle(
//                           fontFamily: AppColor.fontFamily,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 20,
//                           color: Color(0xFF383838),
//                         ),
//                       ),
//                       Container(
//                         width: 6,
//                         height: 6,
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 78,
//             height: 27,
//             margin: EdgeInsets.only(
//               top: 30,
//               left: 25,
//             ),
//             child: Text(
//               "Username",
//               style: TextStyle(
//                 fontFamily: AppColor.fontFamily,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF3E3E3E),
//               ),
//             ),
//           ),
//           Container(
//             width: 335,
//             height: 55,
//             margin: EdgeInsets.only(
//               top: 15,
//               left: 25,
//               right: 25,
//             ),
//             decoration: BoxDecoration(
//               color: Color(0xFFFFFFFF),
//               borderRadius: BorderRadius.circular(27.5),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(
//                     0,
//                     10,
//                   ),
//                   blurRadius: 75,
//                   color: Color(0xFF9393931A).withOpacity(0.01),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFFA9A9A9CC).withOpacity(0.8),
//                     ),
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Create your username",
//                       hintStyle: TextStyle(
//                         fontFamily: AppColor.fontFamily,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 15,
//                         color: Color(0xFFA9A9A9CC).withOpacity(0.8),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 44,
//             height: 27,
//             margin: EdgeInsets.only(
//               top: 35,
//               left: 25,
//             ),
//             child: Text(
//               "Email",
//               style: TextStyle(
//                 fontFamily: AppColor.fontFamily,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF3E3E3E),
//               ),
//             ),
//           ),
//           Container(
//             width: 335,
//             height: 55,
//             margin: EdgeInsets.only(
//               top: 15,
//               left: 25,
//               right: 25,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(27.5),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(
//                     0,
//                     10,
//                   ),
//                   blurRadius: 75,
//                   color: Color(0xFF9393931A).withOpacity(0.01),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                   child: TextField(
//                     controller: _controller1,
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 14,
//                       color: Color(0xFFA9A9A9CC).withOpacity(0.8),
//                     ),
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter your email",
//                       hintStyle: TextStyle(
//                         fontFamily: AppColor.fontFamily,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xFFA9A9A9CC).withOpacity(0.8),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 72,
//             height: 27,
//             margin: EdgeInsets.only(
//               top: 35,
//               left: 25,
//             ),
//             child: Text(
//               "Password",
//               style: TextStyle(
//                 fontFamily: AppColor.fontFamily,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF3E3E3E),
//               ),
//             ),
//           ),
//               Container(
//                 width: 335,
//                 height: 55,
//                 margin: EdgeInsets.only(
//                   top: 15,
//                   left: 25,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(27.5),
//                   boxShadow: [
//                     BoxShadow(
//                       offset: Offset(
//                         0,
//                         10,
//                       ),
//                       blurRadius: 75,
//                       color: Color(0xFF9393931A).withOpacity(0.01),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Expanded(
//                       child: TextField(
//                         controller: _controller2,
//                         obscureText: isHiddenPassword,
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFFA9A9A9CC).withOpacity(0.8),
//                         ),
//                         decoration: InputDecoration(
//                           counterText: "",
//                           border: InputBorder.none,
//                           hintText: "Enter your password",
//                           hintStyle: TextStyle(
//                             fontFamily: AppColor.fontFamily,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 15,
//                             color: Color(0xFFA9A9A9CC).withOpacity(0.8),
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: _togglePasswordView,
//                       child: Container(
//                         width: 24,
//                         height: 24,
//                         margin: EdgeInsets.only(
//                           top: 15,
//                           left: 118,
//                           right: 25,
//                           bottom: 16,
//                         ),
//                         child: isHiddenPassword
//                             ? SvgPicture.asset("assets/icons/eye.svg")
//                             : SvgPicture.asset("assets/icons/eye-off.svg"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//           GestureDetector(
//             onTap: () {
//               if (_controller.text.isNotEmpty) {
//                 if (_controller1.text.isNotEmpty) {
//                   if (_controller2.text.isNotEmpty) {
//                     _saveData1(
//                       _controller.text,
//                       _controller1.text,
//                       _controller2.text,
//                     );
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return CupertinoAlertDialog(
//                           title: Text(
//                             "Muvofaqqiyatli!",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 14,
//                               fontFamily: AppColor.fontFamily,
//                               letterSpacing: 0.5,
//                               color: Color(0xFF327FEB),
//                             ),
//                           ),
//                           content: Text(
//                             "Siz ro'yhatdan o'tdingiz",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 14,
//                               fontFamily: AppColor.fontFamily,
//                               letterSpacing: 0.5,
//                               color: Color(0xFF383838).withOpacity(0.8),
//                             ),
//                           ),
//                           actions: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pop(context);
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(builder: (context){
//                                     return LoginFilled2();
//                                   }),
//                                 );
//                               },
//                               child: Container(
//                                 height: 44,
//                                 color: Colors.transparent,
//                                 child: Center(
//                                   child: Text(
//                                     "Next",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 14,
//                                       fontFamily: AppColor.fontFamily,
//                                       letterSpacing: 0.5,
//                                       decoration: TextDecoration.none,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   } else {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return CupertinoAlertDialog(
//                           title: Text(
//                             "Error!",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 14,
//                               fontFamily: AppColor.fontFamily,
//                               letterSpacing: 1,
//                               color: Colors.red,
//                             ),
//                           ),
//                           content: Text(
//                             "Password da nimadir chappasiga ketdi!",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 14,
//                               fontFamily: AppColor.fontFamily,
//                               letterSpacing: 0.5,
//                               color: Color(0xFF383838).withOpacity(0.8),
//                             ),
//                           ),
//                           actions: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Container(
//                                 height: 44,
//                                 color: Colors.transparent,
//                                 child: Center(
//                                   child: Text(
//                                     "OK",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 14,
//                                       fontFamily: AppColor.fontFamily,
//                                       letterSpacing: 0.5,
//                                       decoration: TextDecoration.none,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   }
//                 } else {
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return CupertinoAlertDialog(
//                         title: Text(
//                           "Error!",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 14,
//                             fontFamily: AppColor.fontFamily,
//                             letterSpacing: 1,
//                             color: Colors.red,
//                           ),
//                         ),
//                         content: Text(
//                           "E-Mail da qatorda nimadir chappasiga ketdi!",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 14,
//                             fontFamily: AppColor.fontFamily,
//                             letterSpacing: 0.5,
//                             color: Color(0xFF383838).withOpacity(0.8),
//                           ),
//                         ),
//                         actions: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Container(
//                               height: 44,
//                               color: Colors.transparent,
//                               child: Center(
//                                 child: Text(
//                                   "OK",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 14,
//                                     fontFamily: AppColor.fontFamily,
//                                     letterSpacing: 0.5,
//                                     decoration: TextDecoration.none,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               } else {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return CupertinoAlertDialog(
//                       title: Text(
//                         "Error!",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 14,
//                           fontFamily: AppColor.fontFamily,
//                           letterSpacing: 1,
//                           color: Colors.red,
//                         ),
//                       ),
//                       content: Text(
//                         "Username da qatorda nimadir chappasiga ketdi!",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                           fontFamily: AppColor.fontFamily,
//                           letterSpacing: 0.5,
//                           color: Color(0xFF383838).withOpacity(0.8),
//                         ),
//                       ),
//                       actions: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             height: 44,
//                             color: Colors.transparent,
//                             child: Center(
//                               child: Text(
//                                 "OK",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 14,
//                                   fontFamily: AppColor.fontFamily,
//                                   letterSpacing: 0.5,
//                                   decoration: TextDecoration.none,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }
//             },
//             child: Container(
//               height: 56,
//               width: w,
//               margin: EdgeInsets.only(
//                 top: 30,
//                 left: 25,
//                 right: 25,
//               ),
//               decoration: BoxDecoration(
//                 color: Color(0xFF327FEB),
//                 borderRadius: BorderRadius.circular(28.5),
//               ),
//               child: Center(
//                 child: Text(
//                   "Sign Up",
//                   style: TextStyle(
//                     fontFamily: AppColor.fontFamily,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700,
//                     color: Color(0xFFFFFFFF),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _togglePasswordView() {
//     setState(() {
//       isHiddenPassword = !isHiddenPassword;
//     });
//   }
//
//   Future<void> _saveData1(String a, String b, String c) async {
//     SharedPreferences prep = await SharedPreferences.getInstance();
//     prep.setString("name", a);
//     prep.setString("mail", b);
//     prep.setString("password", c);
//   }
// }
