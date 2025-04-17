import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talent_insider_learning/app/core/consts/assets.dart';
import 'package:talent_insider_learning/app/core/themes/fonts.dart';
import 'package:talent_insider_learning/app/core/themes/style.dart';
import 'package:talent_insider_learning/app/global_widgets/custom_form_field.dart';
import 'package:talent_insider_learning/app/global_widgets/primary_button.dart';
import 'package:talent_insider_learning/app/global_widgets/secondary_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Style.background01,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Style.defaultMargin,
            vertical: Style.minimumMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 71,
                      fit: BoxFit.cover,
                      image: AssetImage(Assets.logo),
                    ),
                  ],
                ),
              ),
              Text(
                'Welcome Back!',
                style: Fonts.mainText.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Login to your account',
                style: Fonts.mainText.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 40),
              Form(
                key: controller.formKey,
                child: Column(
                  spacing: 24,
                  children: [
                    CustomFormField(
                      controller: controller.emailController,
                      label: 'E-mail',
                      hintText: 'Enter Work E-mail',
                      isRequired: true,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomFormField(
                      controller: controller.passwordController,
                      label: 'Password',
                      hintText: 'Enter Password',
                      isRequired: true,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              PrimaryButton(
                title: 'Log in',
                onPressed: () {
                  if (controller.formKey.currentState?.validate() ?? false) {}
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Style.lightGrey, endIndent: 10),
                  ),
                  Text('Or', style: Fonts.mainText.copyWith(fontSize: 12)),
                  Expanded(child: Divider(color: Style.lightGrey, indent: 10)),
                ],
              ),
              SizedBox(height: 16),
              SecondaryButton(title: 'Explore without Login', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
