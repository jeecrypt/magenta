import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:magenta/models/index.dart' as m;
import 'package:magenta/screens/news_screen.dart';
import 'package:magenta/screens/onboarding/onboarding_screen.dart';
import 'package:magenta/screens/price_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'actual_screen.dart';
import 'chavo_screeb.dart';
import 'add_design_screen.dart';
import 'library_screen.dart';
import 'package:dio/dio.dart' as dio;
import 'package:print_color/print_color.dart';

const String host = 'https://magenta.jeegit.ru';

class Controller extends GetxService{
  Future<Controller> init() async {
    // getNews();
    // getGalleryTags();
    // getGallery();
    return this;
  }

  RxList<m.Price> price = <m.Price>[].obs;
  RxList<m.Actual> actual = <m.Actual>[].obs;
  RxList<m.Chavo> chavo = <m.Chavo>[].obs;
  RxList<m.New> news = <m.New>[].obs;
  RxList<m.GalleryTag> tags = <m.GalleryTag>[].obs;
  RxList<m.Gallery> galleries = <m.Gallery>[].obs;

  Future getPrice() async {
    news.value = [];
    dio.Response response = await dio.Dio().get('$host/api/prices',

    );
    Print.yellow(response.data, name: 'Chavo');
    if(response.statusCode == 200){
      price.value = (response.data['data'] as List).map((e) => m.Price.fromJson(e)).toList();
      // Print.magenta(host +  news.first.image!.url, name: 'News');
    } else {
      // recipe.value = [];
    }
  }

  Future getActual() async {
    news.value = [];
    dio.Response response = await dio.Dio().get('$host/api/actuals?populate[image][fields]=url',

    );
    Print.yellow(response.data, name: 'Chavo');
    if(response.statusCode == 200){
      actual.value = (response.data['data'] as List).map((e) => m.Actual.fromJson(e)).toList();
      // Print.magenta(host +  news.first.image!.url, name: 'News');
    } else {
      // recipe.value = [];
    }
  }

  Future getChavo() async {
    news.value = [];
    dio.Response response = await dio.Dio().get('$host/api/chavos',

    );
    Print.yellow(response.data, name: 'Chavo');
    if(response.statusCode == 200){
      chavo.value = (response.data['data'] as List).map((e) => m.Chavo.fromJson(e)).toList();
      // Print.magenta(host +  news.first.image!.url, name: 'News');
    } else {
      // recipe.value = [];
    }
  }

  Future getNews() async {
    news.value = [];
    dio.Response response = await dio.Dio().get('$host/api/news?populate[image][fields]=url',

    );
    Print.yellow(response.data, name: 'News');
    if(response.statusCode == 200){
      news.value = (response.data['data'] as List).map((e) => m.New.fromJson(e)).toList();
      Print.magenta(host +  news.first.image!.url, name: 'News');
    } else {
      // recipe.value = [];
    }
  }

  Future getGalleryTags() async {
    tags.value = [];
    dio.Response response = await dio.Dio().get('$host/api/gallery-tags',

    );
    Print.yellow(response.data, name: 'gallery tags');
    if(response.statusCode == 200){
      tags.value = (response.data['data'] as List).map((e) => m.GalleryTag.fromJson(e)).toList();

    } else {
      // recipe.value = [];
    }
  }

  Future getGallery({String tag = ''}) async {
    galleries.value = [];
    String filters = '';
    if(tag != ''){
      filters = '&filters[tag][name]=$tag';
    }
    dio.Response response = await dio.Dio().get('$host/api/galleries?populate[image][fields]=url$filters&populate[tag][fields]=name',

    );
    Print.yellow(response.data, name: 'gallery tags');
    if(response.statusCode == 200){
      galleries.value = (response.data['data'] as List).map((e) => m.Gallery.fromJson(e)).toList();
    } else {
      // recipe.value = [];
    }
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/Vectorlogo.svg').paddingOnly(left: 16,right: 12),
                    const Text('Студенческое\nрекламное бюро',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        height: 1
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: (){
                    // OnboardingScreen().launch(context);
                    launchUrlString('tel://+79875842610');
                  }, 
                  icon: SvgPicture.asset('assets/tel.svg')
                ).paddingRight(16)
              ],
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                Image.asset('assets/vopros.png').onTap((){const AddDesignScreen(isQuery: true).launch(context);}),
                Image.asset('assets/galereya.png').onTap((){const LibraryScreen().launch(context);}),
                Image.asset('assets/zakaz.png').onTap((){const AddDesignScreen(isQuery: false).launch(context);}),
                Image.asset('assets/news.png').onTap((){const NewsScreen().launch(context);}),
              ],
            ),
            const Text('Может заинтересовать',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 22,
              ),
            ).paddingOnly(left: 16,bottom: 4),
            Image.asset('assets/Chast.png').onTap((){
              const ChavoScreen().launch(context);
            }).paddingSymmetric(horizontal: 16,vertical: 4),
            Image.asset('assets/aktual.png').onTap((){
              const ActualScreen().launch(context);
            }).paddingSymmetric(horizontal: 16,vertical: 4),
            Image.asset('assets/uslugi.png').onTap((){
              const PriceScreen().launch(context);
            }).paddingSymmetric(horizontal: 16,vertical: 4),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16,bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: const Text('О КОМПАНИИ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  const Text('Наша компания готова делать все, чтобы создать имидж вашего продукта и доставить его, тем самым, увеличивая ваши продажи и предоставляя вам возможность оказаться на рынке.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ).paddingOnly(left: 16,bottom: 16,right: 16),
                ],
              ),
            ),
            Image.asset('assets/pochemu.png').paddingSymmetric(horizontal: 16,vertical: 8),
            AppButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/Group 1.svg'),
                  16.width,
                  const Text('Заказать дизайн',
                    style: TextStyle(
                      fontSize: 22,
                      decoration: TextDecoration.underline
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('assets/tsitata.png').paddingOnly(left: 16,right: 16,top: 16,bottom: 28),
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: SvgPicture.asset('assets/inst.svg',color: const Color(0xffE468C9))
                      ),
                      8.width,
                      IconButton(
                        onPressed: (){},
                        icon: SvgPicture.asset('assets/wa.svg',color: const Color(0xffE468C9))
                      ),
                      8.width,
                      IconButton(
                        onPressed: (){},
                        icon: SvgPicture.asset('assets/vk.svg',color: const Color(0xffE468C9))
                      ),
                      8.width,
                      IconButton(
                        onPressed: (){},
                        icon: SvgPicture.asset('assets/tg.svg',color: const Color(0xffE468C9))
                      ),
                      8.width,
                      IconButton(
                        onPressed: (){},
                        icon: SvgPicture.asset('assets/web.svg',color: const Color(0xffE468C9))
                      ),
                    ],
                  ),
                  Text('КОНТАКТЫ ДЛЯ СВЯЗИ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.18),
                          blurRadius: 2.0,
                          offset: Offset.fromDirection(1.5, 4)
                        ),
                      ],
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    ),
                  ).paddingOnly(top: 16,bottom: 12),
                  Text('+7 987 584 26 10',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.18),
                          blurRadius: 2.0,
                          offset: Offset.fromDirection(1.5, 4)
                        ),
                      ],
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    ),
                  ).paddingOnly(top: 16),
                  Text('samigullinasandra@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.18),
                          blurRadius: 2.0,
                          offset: Offset.fromDirection(1.5, 4)
                        ),
                      ],
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    ),
                  ).paddingOnly(bottom: 12),
                  Text('Республика Башкортостан,город\nУфа,ул. Чернышевского, 141',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.18),
                          blurRadius: 2.0,
                          offset: Offset.fromDirection(1.5, 4)
                        ),
                      ],
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    ),
                  ).paddingOnly(top: 16,bottom: 64),
                ]
              ),
            )
          ],
        ),
      ),
    ); 
  }
}