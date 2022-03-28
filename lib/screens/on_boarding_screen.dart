import 'package:flutter/material.dart';
import 'package:northladder_test_app/screens/home_screen.dart';
import 'package:northladder_test_app/screens/on_boarding_page_1.dart';
import 'package:northladder_test_app/screens/on_boarding_page_2.dart';
import 'package:northladder_test_app/screens/on_boarding_page_3.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/constants.dart';
import 'package:northladder_test_app/utility/radii.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';
import 'package:northladder_test_app/widget/full_width_button.dart';

import '../widget/linear_page_progress_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController(initialPage: 0);
  late Size size;
  final currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    OnBoardingPage1(),
                    OnBoardingPage2(),
                    OnBoardingPage3()
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width / 4.5),
                child: LinearProgressPageIndicator(
                    currentPageNotifier: currentIndex,
                    width: size.width / 2,
                    height: 5,
                    itemCount: 3,
                    progressColor: AppColor.primaryColor),
              ),
              kSmallBox,
              ValueListenableBuilder<int>(
                valueListenable: currentIndex,
                builder: (context, value, _) => TextButtonFullWidth(
                    text: currentIndex.value != 2 ? 'Next' : 'Explore',
                    onTap: toNext),
              ),
              kSmallBox,
              Center(
                child: InkWell(
                  onTap: () {
                    toBack();
                  },
                  child: Text(
                    'Go Back',
                    style: Style.p.textStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void toNext() {
    if (currentIndex.value == 0) {
      _controller.animateToPage(1,
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);

      currentIndex.value = 1;
    } else if (currentIndex.value == 1) {
      _controller.animateToPage(2,
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);

      currentIndex.value = 2;
      print(currentIndex.value);
    }
    else if (currentIndex.value == 2) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen(),),(route) => false);
    }
  }

  void toBack() {
    if (currentIndex.value == 0) {
      Navigator.pop(context);
    } else if (currentIndex.value == 1) {
      _controller.animateToPage(0,
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);

      currentIndex.value = 0;
    }
    else if (currentIndex.value == 2) {
      _controller.animateToPage(1,
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);

      currentIndex.value = 1;
    }
  }
}
