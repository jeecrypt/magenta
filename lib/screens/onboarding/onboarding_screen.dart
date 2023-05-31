import 'package:flutter/material.dart';
import 'package:magenta/screens/onboarding/onboarding1.dart';
import 'package:magenta/screens/onboarding/onboarding2.dart';
import 'package:magenta/screens/onboarding/onboarding3.dart';
import 'package:magenta/screens/open_screen.dart';
import 'package:nb_utils/nb_utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        children: [
          Onboarding1(
            onNext: (){
              controller.animateTo(MediaQuery.of(context).size.width, duration: const Duration(milliseconds: 500), curve: Curves.linear);
            },
          ),
          Onboarding2(
            onNext: (){
              controller.animateTo(MediaQuery.of(context).size.width *2, duration: const Duration(milliseconds: 500), curve: Curves.linear);
            },
          ),
          Onboarding3(
            onNext: (){
              finish(context);
              const OpenScreen().launch(context);
            },
          ),
        ],
      ),
    );
  }
}