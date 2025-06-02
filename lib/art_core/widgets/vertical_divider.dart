import 'package:coach/art_core/art_core.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 1,
      color: AppColors.secondaryBorderColor,
      margin: EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
