import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pay_flow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:pay_flow/shared/auth/auth_controller.dart';
import 'package:pay_flow/shared/models/boleto_model.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/label_button_modal/label_button_modal_widget.dart';

class ModalBoletoWidget {
  InsertBoletoController controller = InsertBoletoController();
  showModalBoleto({
    required BuildContext context,
    required BoletoModel data,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 24),
              child: Container(
                width: 220,
                height: 75,
                child: Text.rich(
                  TextSpan(
                    text: "O boleto ",
                    style: AppTextStyles.titleHeading,
                    children: [
                      TextSpan(
                          text: "${data.name} ",
                          style: AppTextStyles.titleBoldHeading),
                      TextSpan(text: "no valor de "),
                      TextSpan(
                          text: "${data.value!} ",
                          style: AppTextStyles.titleBoldHeading),
                      TextSpan(text: "foi pago ?"),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LabelButtonModalWidget(
                  text: "Ainda não",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 16,
                ),
                LabelButtonModalWidget(
                  text: "Sim",
                  enableBackgroundColor: true,
                  onTap: () async {
                    controller.updateBoleto(data);
                    UserModel user =
                        await AuthController().getCurrentUser(context);
                    Navigator.pushReplacementNamed(context, "/home",
                        arguments: user);
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                controller.deleteBoleto(data);
                UserModel user = await AuthController().getCurrentUser(context);
                Navigator.pushReplacementNamed(context, "/home",
                    arguments: user);
              },
              child: Container(
                padding: EdgeInsets.only(top: 24),
                child: Column(
                  children: [
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.stroke,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.trashAlt,
                          color: AppColors.delete,
                          size: 17.5,
                        ),
                        SizedBox(
                          width: 17.5,
                        ),
                        Text(
                          "Deletar boleto",
                          style: AppTextStyles.titleDelete,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
