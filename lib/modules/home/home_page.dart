import 'package:flutter/material.dart';

import 'package:pay_flow/modules/extract/extract_page.dart';
import 'package:pay_flow/modules/home/home_controller.dart';
import 'package:pay_flow/modules/login/login_controlle.dart';
import 'package:pay_flow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:pay_flow/shared/auth/auth_controller.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          padding: EdgeInsets.only(top: 30),
          height: 152,
          color: AppColors.primary,
          child: Column(
            children: [
              ListTile(
                title: Text.rich(
                  TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: "${widget.user.name}",
                          style: AppTextStyles.titleBoldBackground)
                    ],
                  ),
                ),
                subtitle: Text(
                  "Mantenha as suas contas em dia",
                  style: AppTextStyles.captionShape,
                ),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(widget.user.photoURL!),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await AuthController().deleteUser();
                  await LoginController().googleLogout(context);
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Sair",
                        style: AppTextStyles.captionShape,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.exit_to_app_outlined,
                        color: AppColors.background,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: [
        MeusBoletosPage(
          key: UniqueKey(),
        ),
        ExtractPage(
          key: UniqueKey(),
        ),
      ][controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home),
              color: controller.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
            GestureDetector(
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, "/barcode_scanner").then(
                      (value) => setState(() {}),
                    );
                  },
                  icon: Icon(Icons.add_box_outlined),
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
              icon: Icon(
                Icons.description_outlined,
                color: controller.currentPage == 1
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
