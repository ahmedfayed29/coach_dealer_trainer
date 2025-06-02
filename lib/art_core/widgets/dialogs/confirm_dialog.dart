// import 'package:art_core/art_core.dart';
// import 'package:core/core.dart';
// import 'package:dependencies/dependencies.dart';
//
// showConfirmDialog({String? text, String? textButton, VoidCallback? onTap, bool loadingButton = false, Color? okColor}) {
//   final context = Modular.routerDelegate.navigatorKey.currentContext!;
//   showDialog(
//     context: context,
//     builder: (context) {
//       return Dialog(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             AppText(
//               text: text ?? "",
//               maxLines: 2,
//               textAlign: TextAlign.center,
//               fontWeight: FontWeight.normal,
//               fontSize: 15,
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: AppButton(
//                       title: 'إلغاء',
//                       enableBorder: false,
//                       onTap: () {
//                         Modular.to.pop();
//                       }),
//                 ),
//                 Expanded(
//                   child: AppButton(
//                     color: okColor,
//                     loading: loadingButton,
//                     title: textButton ?? 'نعم',
//                     onTap: onTap ?? () {},
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
