import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class LoadingView extends StatelessWidget {

  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 100),
        width: 70,
        height: 70,
        child: const CircularProgressIndicator(color: AppColors.primaryColor, strokeWidth: 8),
      ),
    );
  }
}
