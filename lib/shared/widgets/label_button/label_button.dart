import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final TextStyle? style;
  const LabelButton(
      {Key? key, required this.label, required this.onTap, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: style ?? AppTextStyles.buttonHeading,
        ),
      ),
    );
  }
}
