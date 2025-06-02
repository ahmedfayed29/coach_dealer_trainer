// import 'package:art_core/art_core.dart';
// import 'package:flutter_modular/flutter_modular.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Widget? centerWidget;
//   final String? centerText;
//   final bool? enableNotification;
//   final VoidCallback? onBack;
//
//   final bool hasBack, showQr;
//
//   const CustomAppBar(
//       {Key? key, this.centerWidget, this.centerText, this.enableNotification = true, this.onBack, this.showQr = false, this.hasBack = true})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     const double radius = 10;
//     return Container(
//       height: context.screenHeight / 7,
//       decoration: const BoxDecoration(
//         boxShadow: [
//           BoxShadow(blurRadius: 999999999999999, color: Color.fromRGBO(40, 51, 74, 0.16)),
//         ],
//       ),
//       child: Container(
//         padding: EdgeInsets.only(top: context.screenHeight / 18, left: 20, right: 20),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               colors: [Color(0xff253D52), Color(0xff156B73), Color(0xff08918F)],
//               begin: AlignmentDirectional.centerStart,
//               end: AlignmentDirectional.centerEnd),
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(radius),
//             bottomRight: Radius.circular(radius),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             showQr
//                 ? const Expanded(
//                     child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Icon(
//                         Icons.qr_code_scanner,
//                         color: Colors.white,
//                       )
//                     ],
//                   ))
//                 : Expanded(
//                     child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       if (hasBack) ...[
//                         BackButton(
//                             color: colorWhite,
//                             onPressed: () {
//                               Modular.to.pop();
//
//                               try {
//                                 onBack;
//                               } catch (e, s) {
//                                 print("Catch_Error_ON_Back $e , $s");
//                               }
//                             }),
//                       ]
//                     ],
//                   )),
//             Expanded(
//                 flex: 3,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     centerWidgetInAppBar(),
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget centerWidgetInAppBar() {
//     if (centerWidget != null) {
//       return centerWidget!;
//     } else {
//       return AppText(
//         text: centerText ?? '',
//         color: colorWhite,
//         fontSize: 18,
//         textAlign: TextAlign.center,
//       );
//     }
//   }
//
//   @override
//   Size get preferredSize {
//     final context = Modular.routerDelegate.navigatorKey.currentContext!;
//
//     return Size(context.screenWidth, context.screenHeight * .1);
//   }
// }
