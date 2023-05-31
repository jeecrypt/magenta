import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nb_utils/nb_utils.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key, required this.onNext});
final Function onNext;
  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  // flex: 1,
                  child: Image.asset('assets/Illustration2.png').paddingOnly(left: 8,right: 8)),
                Text('Поможем\nвоссоздать ваши\nидеи в реальность',
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.black,
                  ),
                ).paddingBottom(MediaQuery.of(context).size.height * .06),
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