import 'package:coach/art_core/art_core.dart';

class DetailsItem extends StatelessWidget {
  final String title;
  final String subTitle;

  const DetailsItem({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          text: title,
          fontSize: 16,
        ),
        SizedBox(height: 4),
        AppText(
          text: subTitle,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
