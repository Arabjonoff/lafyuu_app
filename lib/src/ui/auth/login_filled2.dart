// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:lesson_widget/src/ui/home/home_screen.dart';
// import 'package:lesson_widget/src/ui/auth/sign_up.dart';
// import 'package:lesson_widget/src/app_color/app_color.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LoginFilled2 extends StatefulWidget {
//   const LoginFilled2({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _LoginFilled2State();
//   }
// }
//
// class _LoginFilled2State extends State<LoginFilled2> {
//   bool isHiddenPassword = true;
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
//           SizedBox(
//             height: 68,
//           ),
//           Row(
//             children: [
//               Spacer(),
//               Container(
//                 width: 64,
//                 height: 64,
//                 decoration: BoxDecoration(
//                   color: Color(0xFF327FEB),
//                   borderRadius: BorderRadius.circular(9),
//                 ),
//                 child: Center(
//                   child: SvgPicture.asset("assets/icons/z.svg"),
//                 ),
//               ),
//               Spacer(),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             children: [
//               Container(
//                 width: 240,
//                 height: 73,
//                 child: Row(
//                   children: [
//                     Column(
//                       children: [
//                         Container(
//                           width: 58,
//                           height: 33,
//                           margin: EdgeInsets.only(
//                             top: 19,
//                             left: 33,
//                             right: 46,
//                             bottom: 4,
//                           ),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "Log In",
//                                 style: TextStyle(
//                                   fontFamily: AppColor.fontFamily,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w700,
//                                   color: Color(0xFF383838),
//                                 ),
//                               ),
//                               Container(
//                                 width: 6,
//                                 height: 6,
//                                 decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.circular(100),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       width: 73,
//                       height: 27,
//                       margin: EdgeInsets.only(
//                         top: 20,
//                         bottom: 26,
//                         right: 28,
//                       ),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (context) {
//                               return SignUp();
//                             }),
//                           );
//                         },
//                         child: Text(
//                           "Sign Up",
//                           style: TextStyle(
//                             fontFamily: AppColor.fontFamily,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 20,
//                             color: Color(0xFFA9A9A9),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 25,
//               ),
//               Text(
//                 "Username or Email",
//                 style: TextStyle(
//                   fontFamily: AppColor.fontFamily,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF3E3E3E),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Container(
//                 height: 55,
//                 width: 335,
//                 margin: EdgeInsets.only(
//                   top: 15,
//                   left: 25,
//                   right: 25,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFFFFFFF),
//                   borderRadius: BorderRadius.circular(27.5),
//                 ),
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Expanded(
//                       child: TextField(
//                         controller: _controller1,
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFFA9A9A9CC).withOpacity(0.8),
//                         ),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Enter your username or email",
//                           hintStyle: TextStyle(
//                             fontFamily: AppColor.fontFamily,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 15,
//                             color: Color(0xFFA9A9A9CC).withOpacity(0.8),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 35,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 26,
//               ),
//               Text(
//                 "Password",
//                 style: TextStyle(
//                   fontFamily: AppColor.fontFamily,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF3E3E3E),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Container(
//                 height: 55,
//                 width: 335,
//                 margin: EdgeInsets.only(
//                   top: 15,
//                   left: 25,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(27.5),
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
//                           right: 25,
//                         ),
//                         child: isHiddenPassword
//                             ? SvgPicture.asset("assets/icons/eye.svg")
//                             : SvgPicture.asset("assets/icons/eye-off.svg"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Container(
//                 height: 25,
//                 width: 113,
//                 margin: EdgeInsets.only(
//                   top: 25,
//                   left: 247,
//                 ),
//                 child: Text(
//                   "Forgot Password?",
//                   style: TextStyle(
//                     fontFamily: AppColor.fontFamily,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14,
//                     color: Color(0xFF383838CC).withOpacity(0.8),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   _getData1();
//                 },
//                 child: Container(
//                   height: 57,
//                   width: 335,
//                   margin: EdgeInsets.only(
//                     top: 30,
//                     left: 25,
//                     right: 25,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Color(0xFF327FEB),
//                     borderRadius: BorderRadius.circular(28.5),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Login",
//                       style: TextStyle(
//                         fontFamily: AppColor.fontFamily,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFFFFFFFF),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 33,
//               ),
//               Container(
//                 height: 1,
//                 width: 99,
//                 color: Color(0xFFA9A9A999).withOpacity(0.6),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Text(
//                 "Or login with",
//                 style: TextStyle(
//                   fontFamily: AppColor.fontFamily,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14,
//                   color: Color(0xFF383838CC).withOpacity(0.8),
//                 ),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Container(
//                 height: 1,
//                 width: 99,
//                 color: Color(0xFFA9A9A999).withOpacity(0.6),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Container(
//                 height: 57,
//                 width: 335,
//                 margin: EdgeInsets.only(
//                   top: 20,
//                   left: 25,
//                   right: 25,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(28.5),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 22,
//                       height: 22,
//                       margin: EdgeInsets.only(
//                         top: 17,
//                         bottom: 18,
//                         left: 115,
//                       ),
//                       child: Image.asset(
//                         "assets/images/google.png",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Container(
//                       height: 25,
//                       margin: EdgeInsets.only(
//                         top: 16,
//                         bottom: 16,
//                         left: 15,
//                       ),
//                       child: Text(
//                         "Google",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                           fontFamily: AppColor.fontFamily,
//                           color: Color(0xFF383838),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 16,
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
//   Future<void> _getData1() async {
//     SharedPreferences prep = await SharedPreferences.getInstance();
//     String mail = prep.getString("mail") ?? "";
//     String pass = prep.getString("password") ?? "";
//     print(mail);
//     print(pass);
//     if (_controller1.text == mail && _controller2.text == pass) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context){
//           return  HomeScreen();
//         }),
//       );
//     }
//     else{
//       showDialog(
//         context: context,
//         builder: (context) {
//           return CupertinoAlertDialog(
//             title: Text(
//               "Error!",
//               style: TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 14,
//                 fontFamily: AppColor.fontFamily,
//                 letterSpacing: 1,
//                 color: Colors.red,
//               ),
//             ),
//             content: Text(
//               "E-mail yoki Parolni togri yozilganligiga ishonch hosil qiling",
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 fontFamily: AppColor.fontFamily,
//                 letterSpacing: 0.5,
//                 color: Color(0xFF383838).withOpacity(0.8),
//               ),
//             ),
//             actions: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   height: 44,
//                   color: Colors.transparent,
//                   child: Center(
//                     child: Text(
//                       "OK",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 14,
//                         fontFamily: AppColor.fontFamily,
//                         letterSpacing: 0.5,
//                         decoration: TextDecoration.none,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }
