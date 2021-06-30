import 'package:flutter/material.dart';

import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

class LabelButtonModalWidget extends StatelessWidget {
  final String text;
  final bool enableBackgroundColor;
  final VoidCallback onTap;

  const LabelButtonModalWidget({
    Key? key,
    required this.text,
    this.enableBackgroundColor = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 155,
        height: 55,
        decoration: BoxDecoration(
          color: enableBackgroundColor ? AppColors.primary : AppColors.shape,
          borderRadius: BorderRadius.circular(5),
          border: !enableBackgroundColor
              ? Border.all(color: AppColors.modalBorder)
              : null,
        ),
        child: Center(
          child: Text(
            "$text",
            style: enableBackgroundColor
                ? AppTextStyles.buttonBackground
                : AppTextStyles.titleModalGrey,
          ),
        ),
      ),
    );
  }
}
