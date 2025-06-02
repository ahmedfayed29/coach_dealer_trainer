import 'package:coach/art_core/widgets/text/app_text.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final VoidCallback? onPressed;

  final bool hasIcon;

  final String title;

  const CustomTitle({Key? key, this.onPressed, required this.title, this.hasIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: hasIcon ? onPressed : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(text: title, fontSize: 16),
            hasIcon
                ? const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
