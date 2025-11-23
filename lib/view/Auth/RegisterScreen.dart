import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/Widgets/Button/ColoredFilledButton.dart';

import '../../Widgets/Text/FontText.dart';
import '../../Widgets/textfields/input_field.dart';
import '../../app/routes/Routes.dart';
import '../../app/theam/AppColors.dart';
import '../../controller/AuthController.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authC = Get.find<AuthController>();
    final TextEditingController emailCtrl = TextEditingController();
    final TextEditingController passCtrl = TextEditingController();
    final TextEditingController confirmPassCtrl = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: FontText(
                  context: context,
                  text: "Register",
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
            const SizedBox(height: 12),
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
              label: 'Password',
              controller: passCtrl,
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: FontText(
                  context: context,
                  text: "Confirm Password",
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
            AppTextField(
              label: 'Confirm Password',
              controller: confirmPassCtrl,
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (authC.isLoading.value) {
                return const CircularProgressIndicator();
              }
              return FilledButtonWidget(
                  context: context,
                  onPressed: () {
                    final email = emailCtrl.text.trim();
                    final pass = passCtrl.text.trim();
                    final confirm = confirmPassCtrl.text.trim();

                    if (email.isEmpty || pass.isEmpty) {
                      Get.snackbar('Validation', 'Email and password are required');
                      return;
                    }
                    if (pass != confirm) {
                      Get.snackbar('Validation', 'Passwords do not match');
                      return;
                    }
                    authC.signup(email: email, password: pass);
                  },
                  text: 'Register',
              );
            }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FontText(
                  context: context,
                  text: "already have an account?",
                  fontSize: 14,
                ),
                TextButton(
                  onPressed: () => Get.back(),
                  child: FontText(
                    context: context,
                    text: 'Login',
                    fontSize: 14,
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
