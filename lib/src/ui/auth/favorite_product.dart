// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:lesson_widget/src/ui/auth/product_screen.dart';
// import 'package:lesson_widget/src/app_color/app_color.dart';
//
// class FavoriteProduct extends StatefulWidget {
//   const FavoriteProduct({Key? key}) : super(key: key);
//
//   @override
//   _FavoriteProductState createState() => _FavoriteProductState();
// }
//
// class _FavoriteProductState extends State<FavoriteProduct> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor:AppColor.white,
//         elevation: 0.3,
//         leading: GestureDetector(
//           onTap: (){
//             Navigator.pop(context);
//           },
//           child: Container(
//             width: 24,
//             height: 24,
//             child: Center(child: SvgPicture.asset("assets/icons/back.svg"),),
//           ),
//         ),
//         centerTitle: false,
//         title: Text(
//           "Favorite Product",
//           style: TextStyle(
//             fontWeight: FontWeight.w700,
//             fontSize: 16,
//             fontFamily: AppColor.fontFamilyPoppins,
//             height: 1.5,
//             letterSpacing: 0.5,
//             color: Color(0xFF223263),
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context){
//                           return SaleItemScreen();
//                         }),
//                       );
//                     },
//                     child: Container(
//                       width: 175,
//                       height: 282,
//                       margin: EdgeInsets.only(
//                         top: 16,
//                         left: 16,
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Color(0xFFFFFFFF),
//                         border: Border.all(
//                           color: Color(0xFFEBF0FF),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             width: 133,
//                             height: 133,
//                             margin: EdgeInsets.only(
//                               top: 16,
//                               left: 16,
//                               right: 16,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Image.asset("assets/images/image.png"),
//                           ),
//                           Container(
//                             width: 133,
//                             height: 36,
//                             margin: EdgeInsets.only(
//                               top: 8,
//                               left: 16,
//                               right: 16,
//                             ),
//                             child: Text(
//                               "Nike Air Max 270 React ENG",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 12,
//                                 fontFamily: AppColor.fontFamilyPoppins,
//                                 height: 1.5,
//                                 letterSpacing: 0.5,
//                                 color: Color(0xFF223263),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 68,
//                             height: 12,
//                             margin: EdgeInsets.only(
//                               top: 4,
//                               left: 16,
//                               right: 81,
//                             ),
//                             child: SvgPicture.asset("assets/icons/star.svg"),
//                           ),
//                           Container(
//                             width: 52,
//                             height: 22,
//                             margin: EdgeInsets.only(
//                               top: 16,
//                               left: 16,
//                               right: 97,
//                             ),
//                             child: SvgPicture.asset("assets/icons/price.svg"),
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 width: 101,
//                                 height: 15,
//                                 margin: EdgeInsets.only(
//                                   top: 4,
//                                   left: 16,
//                                   right: 8,
//                                 ),
//                                 child: SvgPicture.asset("assets/icons/price6.svg"),
//                               ),
//                               Container(
//                                 width: 24,
//                                 height: 24,
//                                 child: SvgPicture.asset("assets/icons/trash.svg"),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context){
//                           return SaleItemScreen();
//                         }),
//                       );
//                     },
//                     child: Container(
//                       width: 175,
//                       height: 282,
//                       margin: EdgeInsets.only(
//                         top: 12,
//                         left: 16,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(
//                           color: Color(0xFFEBF0FF),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             width: 133,
//                             height: 133,
//                             margin: EdgeInsets.only(
//                               top: 16,
//                               left: 16,
//                               right: 16,
//                             ),
//                             child: Image.asset("assets/images/krasovka.png"),
//                           ),
//                           Container(
//                             width: 133,
//                             height: 36,
//                             margin: EdgeInsets.only(
//                               top: 8,
//                               left: 16,
//                               right: 16,
//                             ),
//                             child: Text(
//                               "Nike Air Max 270 React ENG",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w700,
//                                 height: 1.5,
//                                 fontFamily: AppColor.fontFamilyPoppins,
//                                 letterSpacing: 0.5,
//                                 color: Color(0xFF223263),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 68,
//                             height: 12,
//                             margin: EdgeInsets.only(top: 4,left: 16,right: 81,),
//                             child: SvgPicture.asset("assets/icons/star.svg"),
//                           ),
//                           Container(
//                             width: 52,
//                             height: 22,
//                             margin: EdgeInsets.only(top: 16,left: 16,right: 97,),
//                             child: SvgPicture.asset("assets/icons/price.svg"),
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 width: 101,
//                                 height: 15,
//                                 margin: EdgeInsets.only(
//                                   top: 4,
//                                   left: 16,
//                                   right: 8,
//                                 ),
//                                 child: SvgPicture.asset("assets/icons/price6.svg"),
//                               ),
//                               Container(
//                                 width: 24,
//                                 height: 24,
//                                 child: SvgPicture.asset("assets/icons/trash.svg"),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context){
//                           return SaleItemScreen();
//                         }),
//                       );
//                     },
//                     child: Container(
//                       width: 175,
//                       height: 282,
//                       margin: EdgeInsets.only(
//                         top: 16,
//                         left: 13,
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Color(0xFFFFFFFF),
//                         border: Border.all(
//                           color: Color(0xFFEBF0FF),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             width: 133,
//                             height: 133,
//                             margin: EdgeInsets.only(
//                               top: 16,
//                               left: 16,
//                               right: 16,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Image.asset("assets/images/krasovka2.png"),
//                           ),
//                           Container(
//                             width: 133,
//                             height: 36,
//                             margin: EdgeInsets.only(
//                               top: 8,
//                               left: 16,
//                               right: 16,
//                             ),
//                             child: Text(
//                               "Nike Air Max 270 React ENG",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 12,
//                                 height: 1.5,
//                                 fontFamily: AppColor.fontFamilyPoppins,
//                                 letterSpacing: 0.5,
//                                 color: Color(0xFF223263),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 68,
//                             height: 12,
//                             margin: EdgeInsets.only(
//                               top: 4,
//                               left: 16,
//                               right: 81,
//                             ),
//                             child: SvgPicture.asset("assets/icons/star.svg"),
//                           ),
//                           Container(
//                             width: 52,
//                             height: 22,
//                             margin: EdgeInsets.only(
//                               top: 16,
//                               left: 16,
//                               right: 97,
//                             ),
//                             child: SvgPicture.asset("assets/icons/price.svg"),
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 width: 101,
//                                 height: 15,
//                                 margin: EdgeInsets.only(
//                                   top: 4,
//                                   left: 16,
//                                   right: 8,
//                                 ),
//                                 child: SvgPicture.asset("assets/icons/price6.svg"),
//                               ),
//                               Container(
//                                 width: 24,
//                                 height: 24,
//                                 child: SvgPicture.asset("assets/icons/trash.svg"),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context){
//                           return SaleItemScreen();
//                         }),
//                       );
//                     },
//                     child: Container(
//                       width: 175,
//                       height: 282,
//                       margin: EdgeInsets.only(
//                         top: 12,
//                         left: 13,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(
//                           color: Color(0xFFEBF0FF),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             width: 133,
//                             height: 133,
//                             margin: EdgeInsets.only(
//                               top: 16,
//                               left: 16,
//                               right: 16,
//                             ),
//                             child: Image.asset("assets/images/sumka.png"),
//                           ),
//                           Container(
//                             width: 133,
//                             height: 36,
//                             margin: EdgeInsets.only(
//                               top: 8,
//                               left: 16,
//                               right: 16,
//                             ),
//                             child: Text(
//                               "Nike Air Max 270 React ENG",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w700,
//                                 height: 1.5,
//                                 fontFamily: AppColor.fontFamilyPoppins,
//                                 letterSpacing: 0.5,
//                                 color: Color(0xFF223263),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 68,
//                             height: 12,
//                             margin: EdgeInsets.only(top: 4,left: 16,right: 81,),
//                             child: SvgPicture.asset("assets/icons/star.svg"),
//                           ),
//                           Container(
//                             width: 52,
//                             height: 22,
//                             margin: EdgeInsets.only(top: 16,left: 16,right: 97,),
//                             child: SvgPicture.asset("assets/icons/price.svg"),
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 width: 101,
//                                 height: 15,
//                                 margin: EdgeInsets.only(
//                                   top: 4,
//                                   left: 16,
//                                   right: 8,
//                                 ),
//                                 child: SvgPicture.asset("assets/icons/price6.svg"),
//                               ),
//                               Container(
//                                 width: 24,
//                                 height: 24,
//                                 child: SvgPicture.asset("assets/icons/trash.svg"),
//                               ),
//                             ],
//                           ),
//                         ],
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
// }
