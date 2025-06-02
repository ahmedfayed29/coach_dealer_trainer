import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRatingBar extends StatelessWidget {
  final bool ignoreGestures;
  final double rating;
  const CustomRatingBar({super.key, this.ignoreGestures = false, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: false,
      ignoreGestures: ignoreGestures,
      itemSize: 15,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: SvgPicture.asset('assets/icons/star.svg'),
        half: SizedBox(),
        empty: SvgPicture.asset('assets/icons/star_outlined.svg'),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
    ;
  }
}
