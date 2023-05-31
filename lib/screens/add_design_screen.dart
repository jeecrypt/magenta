import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magenta/screens/zayavka_otpavlena_screen.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class AddDesignScreen extends StatefulWidget {
  final bool isQuery;
  const AddDesignScreen({super.key, required this.isQuery});

  @override
  State<AddDesignScreen> createState() => _AddDesignScreenState();
}

class _AddDesignScreenState extends State<AddDesignScreen> {
  bool isQuery = false;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    isQuery = widget.isQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Center(
          child: SvgPicture.asset('assets/addOrder.svg'),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
              // statusBarColor: Colors.black,
              // systemNavigationBarColor: Colors.amber
            ),
            backgroundColor: Colors.transparent,
            leading: IconButton(onPressed:(){finish(context);}, 
            icon: Icon(Icons.arrow_back_ios)),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black.withOpacity(.65)
                  ),
                  child: Column(
                    children: [
                      Text('Оставить заявку',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.18),
                              blurRadius: 2.0,
                              offset: Offset.fromDirection(1.5, 4)
                            ),
                          ],
                          fontSize: 34,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const Text('Оставьте заявку и наша команда\nсвяжется с вами',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                        ),
                      ).paddingSymmetric(vertical: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(isQuery ? 'assets/Radiobutton(1).svg' : 'assets/Radiobutton.svg'),
                              const Text('Хочу заказать',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400
                                ),
                              ).paddingSymmetric(vertical: 8,horizontal: 8)
                            ],
                          ).onTap((){
                            setState(() {
                              isQuery = false;
                            });
                          }),
                          Row(
                            children: [
                              SvgPicture.asset(isQuery ? 'assets/Radiobutton.svg' : 'assets/Radiobutton(1).svg'),
                              const Text('У меня вопрос',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400
                                ),
                              ).paddingSymmetric(vertical: 16,horizontal: 8)
                            ],
                          ).onTap((){
                            setState(() {
                              isQuery = true;
                            });
                          }),
                        ],
                      ).paddingBottom(16),
                      // TextField(
                      //   keyboardType: TextInputType.emailAddress,
                      //   controller: email,
                      //   decoration: InputDecoration(
                      //     contentPadding: const  EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(14),
                      //       borderSide: BorderSide.none
                      //     ),
                      //     hintText: 'Email',
                      //   // prefix: 16.width,
                      //     filled: true,
                      //     fillColor: Colors.white30,
                      //     hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 17,)
                      //   ),
                      // ).paddingSymmetric(horizontal: 16 ),
                      TextField(
                        controller: name,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none
                          ),
                          hintText: 'Имя',
                          
                        // prefix: 16.width,
                          filled: true,
                          fillColor: Colors.white30,
                          hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 17,)
                        ),
                      ).paddingSymmetric(horizontal: 16, vertical: 16),
                      TextField(
                        keyboardType: TextInputType.phone,
                        controller: phone,
                        decoration: InputDecoration(
                          
                          contentPadding: const  EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none
                          ),
                          hintText: 'Номер телефона',
                        // prefix: 16.width,
                          filled: true,
                          fillColor: Colors.white30,
                          hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 17,)
                        ),
                      ).paddingSymmetric(horizontal: 16 ),
                      AppButton(
                        onTap: (){
                          if(name.text.isNotEmpty && phone.text.isNotEmpty){
                            const ZayavkaScreen().launch(context);
                            sendEmail(
                              isQurey: isQuery,
                              email: email.text,
                              name: name.text,
                              phone: phone.text
                            );
                          } else {
                            snackBar(context,
                              title: 'Заполните все поля'
                            );
                          }
                        },
                        shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabled: true,
                        margin: const EdgeInsets.only(left: 16,right: 16,top: 24,bottom: 24),
                        height: 54,
                        width: double.maxFinite,
                        disabledColor: Colors.white38,
                        color: Colors.black,
                        text: 'Отправить',
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ],
    );
  }
}