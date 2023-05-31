import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magenta/screens/home_screen.dart';
import 'package:magenta/screens/posts_screen.dart';
import 'package:magenta/widgets/news_widget.dart';
import 'package:nb_utils/nb_utils.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  Controller controller = Get.find();

  @override
  void initState() {
    controller.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){finish(context);}, 
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffE468C9),
          ),
          child: const Text('Наши новости',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() => controller.news.isNotEmpty ? Column(
          children: controller.news.map((n) => NewsWidget(
              n: n
            ).onTap((){
              PostsScreen(
                n: n,
              ).launch(context);
            })).toList()
        ) : Container()),
      )
    );
  }
}