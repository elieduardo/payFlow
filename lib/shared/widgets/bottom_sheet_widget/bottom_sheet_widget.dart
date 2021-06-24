import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnTap;
  final String secundaryLabel;
  final VoidCallback secundaryOnTap;
  final String title;
  final String subtitle;
  const BottomSheetWidget(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnTap,
      required this.secundaryLabel,
      required this.secundaryOnTap,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                          text: title,
                          style: AppTextStyles.buttonBoldHeading,
                          children: [
                            TextSpan(
                                text: "\n$subtitle",
                                style: AppTextStyles.buttonHeading),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      color: AppColors.stroke,
                      height: 1,
                      thickness: 1,
                    ),
                    SetLabelButton(
                      enablePrimaryColor: true,
                      primaryLabel: primaryLabel,
                      primaryOnTap: primaryOnTap,
                      secundaryLabel: secundaryLabel,
                      secundaryOnTap: secundaryOnTap,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
