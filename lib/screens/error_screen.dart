import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Нет соединения\nс интернетом',
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
            ),
          ),
          Image.asset('assets/error.png').paddingOnly(right: 32,top: 16)
        ],
      ),
    );
  }
}