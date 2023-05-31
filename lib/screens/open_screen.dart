import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magenta/screens/home_screen.dart';
import 'package:nb_utils/nb_utils.dart';

class OpenScreen extends StatefulWidget {
  const OpenScreen({super.key});

  @override
  State<OpenScreen> createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1;
      });
    });
    Timer(const Duration(seconds: 3), () {
      finish(context);
      const HomeScreen().launch(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        opacity: opacity,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 800),
        // alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          child: Image.asset('assets/logoset.png',
            width: MediaQuery.of(context).size.width *.55,
          ),
        )
      ),
    );
  }
}