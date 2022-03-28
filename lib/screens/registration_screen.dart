import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:northladder_test_app/screens/on_boarding_screen.dart';
import 'package:northladder_test_app/screens/sign_in_page.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/constants.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';
import 'package:northladder_test_app/widget/app_text_field.dart';
import 'package:northladder_test_app/widget/full_width_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(
              'Create with email',
              style: Style.h2.textStyle.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Once submitted, our customer service team will call you to guide you thru account activation process.',
                style: Style.p.textStyle.copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            AppTextField(
              controller: _fullNameController,
              label: 'Full name',
            ),
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
            AppTextField(
              controller: _confirmPasswordController,
              label: 'Confirm password',
              canObscure: true,
            ),
            kSmallBox,
            TextButtonFullWidth(
                text: 'Create my account', onTap: toOnBoardingScreen),
            kMediumBox,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By signing up you agree to the ',
                style: Style.p.textStyle
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: 'Terms and conditions ',
                    style: Style.p.textStyle.copyWith(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: 'and ',
                    style: Style.p.textStyle.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: 'Privacy policy ',
                    style: Style.p.textStyle.copyWith(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already have an account? ',
                style: Style.p.textStyle
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: 'Log In',
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }

  void toOnBoardingScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      ),
    );
  }
}
