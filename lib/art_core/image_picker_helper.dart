// import 'dart:io';
//
// import 'package:art_core/art_core.dart';
// import 'package:art_core/widgets/extensions/widgets_extensions.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImagePickerHelper {
//   Future<File> openCamera() async {
//     var image = await ImagePicker().pickImage(source: ImageSource.camera);
//     File image0 = File(image!.path);
//     return image0;
//   }
//
//   Future<File> openGallery() async {
//     var image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     File image0 = File(image!.path);
//     return image0;
//   }
//
//   void showChooseImageBottomSheet(Function onSelectImage) {
//     showModalBottomSheet(
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
//         context: Modular.routerDelegate.navigatorKey.currentContext!,
//         builder: (context) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const AppText(text: "مصدر الصورة").paddingOnly(top: 20),
//               TextButton(
//                 onPressed: () async {
//                   File image = await openCamera();
//                   onSelectImage(image.path);
//                 },
//                 child: const AppText(text: "من الكاميرا"),
//               ),
//               const Divider(),
//               TextButton(
//                       onPressed: () async {
//                         File image = await openGallery();
//                         onSelectImage(image.path);
//                       },
//                       child: const AppText(text: "من المعرض"))
//                   .paddingOnly(bottom: 20)
//             ],
//           );
//         });
//   }
// }
//
// class CustomCircleImage extends StatelessWidget {
//   final bool forView;
//
//   final String? initialValue;
//
//   final Function(String)? onTap;
//
//   const CustomCircleImage({super.key, this.forView = false, this.onTap, required this.initialValue});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         if (onTap != null && !forView) {
//           ImagePickerHelper().showChooseImageBottomSheet((image) {
//             onTap!(image);
//             // addNewVisitorBloc.add(UpdateImage(image));
//             Modular.to.pop();
//           });
//         }
//       },
//       child: Stack(
//         children: [
//           if (initialValue != null && initialValue!.isNotEmpty) ...[
//             if (initialValue!.startsWith('http') || initialValue!.startsWith('https')) ...[
//               Center(
//                 child: Container(
//                   margin: const EdgeInsets.only(top: 10),
//                   height: 80,
//                   width: 80,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(initialValue!), fit: BoxFit.fill), shape: BoxShape.circle),
//                 ),
//               ),
//             ] else ...[
//               Center(
//                 child: Container(
//                   margin: const EdgeInsets.only(top: 10),
//                   height: 80,
//                   width: 80,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(image: DecorationImage(image: FileImage(File(initialValue!)), fit: BoxFit.fill), shape: BoxShape.circle),
//                 ),
//               ),
//             ]
//           ] else ...[
//             Center(
//               child: Container(
//                 margin: const EdgeInsets.only(top: 10),
//                 height: 80,
//                 width: 80,
//                 alignment: Alignment.center,
//                 child: SvgPicture.asset("assets/images/upload.svg"),
//               ),
//             ),
//           ],
//           Align(
//             alignment: Alignment.center,
//             child: Image.asset(
//               "assets/images/upload_image_frame.png",
//               height: 100,
//             ),
//           ),
//           if (onTap != null && initialValue != null && initialValue!.isNotEmpty && !forView)
//             Positioned(
//               top: 70,
//               left: MediaQuery.of(context).size.width * 0.57,
//               child: Material(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                 child: CircleAvatar(
//                   radius: 15,
//                   backgroundColor: Colors.white,
//                   child: SvgPicture.asset(
//                     "assets/images/pencil.svg",
//                     height: 18,
//                     width: 18,
//                   ),
//                 ),
//               ),
//             )
//         ],
//       ),
//     );
//   }
// }
