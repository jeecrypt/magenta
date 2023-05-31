import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nb_utils/nb_utils.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key, required this.onNext});
final Function onNext;
  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                36.height,
                Text('Ответим на все\nваши вопросы и\nнайдем решения',
              style: TextStyle(
                fontSize: 42,
                color: Colors.black,
              ),
            ),
            32.height,
            Center(child: Image.asset('assets/illust3.png')),
              ],
            ),
          ),
          
          AppButton(
            onTap: (){
              widget.onNext();
            },
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            enabled: true,
            margin: EdgeInsets.only(bottom: 36,top: 16),
            height: 54,
            width: double.maxFinite,
            disabledColor: Colors.white38,
            color: Colors.black,
            text: 'Продолжить',
            textStyle: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),
          )
        ], 
      ).paddingAll(24),
    );
  }
}
//widget.onNext();