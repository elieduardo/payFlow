import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/label_button/label_button.dart';

class SetLabelButton extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnTap;
  final String secundaryLabel;
  final VoidCallback secundaryOnTap;
  final bool enablePrimaryColor;
  const SetLabelButton({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnTap,
    required this.secundaryLabel,
    required this.secundaryOnTap,
    this.enablePrimaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              onTap: primaryOnTap,
              style: enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
            ),
          ),
          VerticalDivider(
            color: AppColors.stroke,
            width: 1,
            thickness: 1,
          ),
          Expanded(
            child: LabelButton(
              label: secundaryLabel,
              onTap: secundaryOnTap,
            ),
          ),
        ],
      ),
    );
  }
}
