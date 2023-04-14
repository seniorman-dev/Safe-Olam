import 'package:flutter/material.dart';
import 'package:olam_grains/constants/app_theme.dart';


class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 4.0,
        color: AppTheme.mainColor,
      ),
    );
  }
}
