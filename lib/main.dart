import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magenta/screens/home_screen.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:magenta/screens/onboarding/onboarding_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

Dio dio = Dio();
late DioCacheManager dioCacheManager;

void main() async {
  dioCacheManager = DioCacheManager(CacheConfig(
    baseUrl: host,
    maxMemoryCacheCount: 1000
  ));
  // _dioCacheManager.clearAll();
  dio.interceptors.add(dioCacheManager.interceptor);
  await Get.putAsync(() => Controller().init());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        useMaterial3: true,
        fontFamily: 'Jost',
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          titleSpacing: 0
        ),
        scaffoldBackgroundColor: Colors.transparent,),
      home: const OnboardingScreen()
    );
  }
}

void sendEmail({required String email, required String phone, required bool isQurey, required String name}){
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'samigullinasandra@gmail.com',
        queryParameters: {
            'subject': ('${isQurey ? 'Вопрос' : 'Заявка'} из приложения от пользовалеля `$name`, тел.: $phone'),
            'body': '''${isQurey ? 'Вопрос' : 'Заявка'} из приложения от пользовалеля `$name`, тел.: $phone.
Здравствуйте, я хочу ${isQurey ? 'задать вам вопрос' : 'заказать у вас'}:

--------------------------------------------------
Можете прикрепить ваш файл к письму
'''
        },
    );
    launchUrlString(emailLaunchUri.toString().replaceAll('+', '%20'));
}