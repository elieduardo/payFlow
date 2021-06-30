import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import 'package:pay_flow/shared/models/boleto_model.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/boleto_modal/boleto_modal_widget.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTileWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        onTap: data.isPayed == false
            ? () {
                ModalBoletoWidget().showModalBoleto(
                  context: context,
                  data: data,
                );
              }
            : () {},
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: AppTextStyles.titleListTile,
        ),
        subtitle: Text(
          isExpired(data.dueDate!)
              ? "Venceu em ${data.dueDate}"
              : "Vence em ${data.dueDate}",
          style: AppTextStyles.captionBody,
        ),
        trailing: Text.rich(
          TextSpan(
            text: "${data.value!.split(" ")[0]}",
            style: AppTextStyles.trailingRegular,
            children: [
              TextSpan(
                text: " ${data.value!.split(" ")[1]}",
                style: AppTextStyles.trailingBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool isExpired(String date) {
  var _date = date.split("/");
  return DateTime.now()
      .isAfter(DateTime.parse(_date[2] + '-' + _date[1] + '-' + _date[0]));
}
