import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/Widgets/Button/ColoredFilledButton.dart';
import 'package:uptodo/Widgets/Text/FontText.dart';
import 'package:uptodo/app/theam/AppColors.dart';

import '../../Widgets/textfields/input_field.dart';
import '../../app/routes/Routes.dart';
import '../../controller/AuthController.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authC = Get.find<AuthController>();
    final TextEditingController emailCtrl = TextEditingController();
    final TextEditingController passCtrl = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: FontText(
                  context: context,
                  text: "Login",
                  fontSize: 32,
                  fontWeight: FontWeight.w800
              ),
            ),
            SizedBox(height: 80),
            Align(
              alignment: Alignment.centerLeft,
              child: FontText(
                  context: context,
                  text: "Email",
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
            AppTextField(
              label: 'Enter your Email',
              controller: emailCtrl,
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: FontText(
                  context: context,
                  text: "Password",
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
            AppTextField(
              label: 'Enter Password',
              controller: passCtrl,
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (authC.isLoading.value) {
                return const CircularProgressIndicator();
              }
              return SizedBox(
                width: double.infinity,
                child: FilledButtonWidget(
                    context: context,
                    onPressed: () {
                      String email = emailCtrl.text.trim();
                      String password = passCtrl.text.trim();
                      authC.login(email: email, password: password);
                    },
                    text: 'Login',
                )
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FontText(
                  context: context,
                  text: "Don\'t have an account?",
                  fontSize: 14,
                ),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.register),
                  child: FontText(
                    context: context,
                    text: 'Register',
                    fontSize: 14,
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
