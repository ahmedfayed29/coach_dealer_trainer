import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../art_core/widgets/custom_rating_bar.dart';
import '../../../../art_core/widgets/text/app_text.dart';

class BookCoachItem extends StatelessWidget {
  final String image;
  final String name;
  final double rating;
  const BookCoachItem({super.key, required this.image, required this.name, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 20,
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: name,
                fontSize: 14,
              ),
              CustomRatingBar(
                rating: rating,
                ignoreGestures: true,
              )
            ],
          ),
        ],
      ).marginSymmetric(vertical: 8, horizontal: 10),
    );
  }
}
