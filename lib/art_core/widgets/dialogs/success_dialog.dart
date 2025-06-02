// import 'dart:async';
//
// import 'package:art_core/art_core.dart';
// import 'package:art_core/widgets/extensions/widgets_extensions.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// showSuccessDialog(BuildContext context, String title, VoidCallback? onDoneClick, bool showButton) async {
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Settings",
//     barrierDismissible: false,
//     // barrierColor: Colors.transparent,
//     transitionDuration: const Duration(milliseconds: 500),
//     pageBuilder: (_, __, ___) => SuccessPopUp(title: title, onDoneClick: onDoneClick, showButton: showButton),
//     transitionBuilder: (_, anim, __, child) {
//       Tween<Offset> tween;
//       if (anim.status == AnimationStatus.reverse) {
//         tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
//       } else {
//         tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
//       }
//       return SlideTransition(
//         position: tween.animate(anim),
//         child: FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//   );
//   Future.delayed(const Duration(seconds: 3), onDoneClick);
// }
//
// class SuccessPopUp extends StatefulWidget {
//   final String title;
//   final Function? onDoneClick;
//   final bool showButton;
//
//   const SuccessPopUp({
//     Key? key,
//     required this.title,
//     this.onDoneClick,
//     required this.showButton,
//   }) : super(key: key);
//
//   @override
//   State<SuccessPopUp> createState() => _SuccessPopUpState();
// }
//
// class _SuccessPopUpState extends State<SuccessPopUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 40),
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: AppColors.primaryColor.withOpacity(.9),
//               offset: const Offset(3, 3),
//               blurRadius: 8,
//             ),
//           ],
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Material(
//           color: Colors.transparent,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Align(
//                     alignment: AlignmentDirectional.topEnd,
//                     child: InkWell(
//                       onTap: () {
//                         Modular.to.pop();
//                       },
//                       child: SvgPicture.asset(
//                         'assets/icons/close.svg',
//                       ).paddingSymmetric(horizontal: 8, vertical: 8),
//                     )),
//                 SvgPicture.asset('assets/icons/success.svg'),
//                 Text(
//                   widget.title,
//                   textAlign: TextAlign.center,
//                   overflow: TextOverflow.visible,
//                   style: const TextStyle(
//                     color: Color(0xffAA8D4D),
//                     fontSize: 20,
//                   ),
//                 ).paddingOnly(bottom: 20),
//                 if (widget.showButton) ...[
//                   AppButton(
//                     title: "ok",
//                     onTap: () {
//                       Modular.to.pop();
//                       if (widget.onDoneClick != null) {
//                         widget.onDoneClick!();
//                       }
//                     },
//                   )
//                 ]
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
