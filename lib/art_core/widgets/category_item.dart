import 'package:coach/art_core/art_core.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final bool isSelected;
  const CategoryItem({super.key, required this.name, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsetsDirectional.only(end: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : AppColors.containerBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isSelected ? AppColors.primaryColor : Colors.transparent),
      ),
      child: AppText(
        text: name,
        color: isSelected ? AppColors.white : AppColors.textSecondary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
