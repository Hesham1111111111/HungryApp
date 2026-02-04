import 'package:flutter/material.dart';

import '../../../../../core/resources/app_colors.dart';

class BackgroundColor extends StatelessWidget {
  const BackgroundColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
