import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

class ZayavkaScreen extends StatefulWidget {
  const ZayavkaScreen({super.key});

  @override
  State<ZayavkaScreen> createState() => _ZayavkaScreenState();
}

class _ZayavkaScreenState extends State<ZayavkaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          const Text('Заявка отправлена!',
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
            ),
          ),
          SvgPicture.asset('assets/Mail.svg').paddingOnly(top: 32),
          AppButton(
            onTap: (){
              finish(context);
            },
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            enabled: true,
            margin: const EdgeInsets.only(top: 42,left: 42,right: 42),
            height: 54,
            elevation: 0,
            width: double.maxFinite,
            disabledColor: Colors.white38,
            color: const Color(0xff949CEB),
            text: 'Вернуться на главную',
            textStyle: const TextStyle(
              fontSize: 22,
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}