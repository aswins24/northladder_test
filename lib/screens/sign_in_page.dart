import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:northladder_test_app/screens/home_screen.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/constants.dart';

import '../utility/style/text_style.dart';
import '../widget/app_text_field.dart';
import '../widget/full_width_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late TapGestureRecognizer _recognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recognizer = TapGestureRecognizer()..onTap = onTap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.white,
        child: Column(
          children: [
            Text(
              'Sign up',
              style: Style.h2.textStyle.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            kMediumBox,
            AppTextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              label: 'Email',
            ),
            AppTextField(
              controller: _passwordController,
              label: 'Password',
              canObscure: true,
            ),
            kSmallBox,
            TextButtonFullWidth(
                text: 'Log in',
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false);
                }),
            kSmallBox,
            Text(
              'Forgot your password?',
              style: Style.p.textStyle.copyWith(
                  fontWeight: FontWeight.w400, color: AppColor.primaryColor),
            ),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: Style.p.textStyle
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: 'Sign up',
                    recognizer: _recognizer,
                    style: Style.p.textStyle.copyWith(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            kMediumBox,
            kMediumBox,
          ],
        ),
      ),
    );
  }

  void onTap() {
    Navigator.pop(context);
  }
}
