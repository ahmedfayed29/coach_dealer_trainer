import 'package:coach/art_core/art_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final bool hasDivider;
  final Widget? trailing;
  final VoidCallback onTap;

  const MenuItem(
      {super.key, this.hasDivider = true, required this.title, required this.onTap, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                text: title,
                fontSize: 16,
              ),
              Spacer(),
              if (trailing != null) ...[
                trailing!,
              ],
              Icon(CupertinoIcons.forward, size: 22),
            ],
          ).marginSymmetric(vertical: 8),
        ),
        if (hasDivider) ...[
          Divider(color: AppColors.dividerColor.withOpacity(0.2)),
        ]
      ],
    );
  }
}
