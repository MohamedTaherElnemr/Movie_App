import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';

class Seprator extends StatelessWidget {
  const Seprator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 100,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [AppColor.violet, AppColor.royalBlue])),
    );
  }
}
