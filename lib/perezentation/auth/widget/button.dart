import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';

class GLobalButton extends StatelessWidget {
  const GLobalButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.c_273032,
        ),
        child: TextButton(
            onPressed: onPressed,
            child: Text(text,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white))));
  }
}
