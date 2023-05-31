import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key, required this.onNext});
final Function onNext;
  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                36.height,
                Row(
                  children: [
                    Text('MAGENTA',
                      style: TextStyle(
                        fontSize: 42,
                        color: Color(0xffE468C9),
                      ),
                    ),
                    Text(' - это',
                      style: TextStyle(
                        fontSize: 42,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Text('ваш помощник\nв креативной\nиндустрии',
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Image.asset('assets/Illustration.png')),
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
            margin: EdgeInsets.only(bottom: 36),
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