import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magenta/screens/home_screen.dart';
import 'package:nb_utils/nb_utils.dart';

class ActualScreen extends StatefulWidget {
  const ActualScreen({super.key});

  @override
  State<ActualScreen> createState() => _ActualScreenState();
}

class _ActualScreenState extends State<ActualScreen> {

  Controller c = Get.find();

  @override
  void initState() {
    super.initState();
    c.getActual();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          child: const Text("Что сейчас актуально?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: Obx(() => c.actual.isNotEmpty ? ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: c.actual.first.image.map((image) => Container(
                    margin: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 4),
                    width: MediaQuery.of(context).size.width *.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(image: NetworkImage(host + image.url), fit: BoxFit.cover)
                    ),
                  )).toList()
              ) : Container()),
            ),
            Obx(() => c.actual.isNotEmpty ?  Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(c.actual.first.title,
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.2,
                      fontWeight: FontWeight.w500
                    ),
                  ).paddingBottom(8),
                  Text(c.actual.first.contant,
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.2,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ) : Container()),
          ],
        ),
      )
    );
  }
}