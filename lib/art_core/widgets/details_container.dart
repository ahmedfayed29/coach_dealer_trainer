import 'package:coach/art_core/art_core.dart';

class DetailsContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  const DetailsContainer({super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
