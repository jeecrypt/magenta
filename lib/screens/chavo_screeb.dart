import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import 'home_screen.dart';

class ChavoScreen extends StatefulWidget {
  const ChavoScreen({super.key});

  @override
  State<ChavoScreen> createState() => _ChavoScreenState();
}

class _ChavoScreenState extends State<ChavoScreen> {

  Controller c = Get.find();

  @override
  void initState() {
    super.initState();
    c.getChavo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){finish(context);}, 
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xff949CEB),
          ),
          child: const Text("Часто задаваемые вопросы",
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
            Container(
              margin: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 4),
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(image: AssetImage('assets/zyro-image.png'),fit: BoxFit.contain)
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              child: Obx(() => c.chavo.isNotEmpty ? ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: c.chavo.map((chavo) => ListTile(
                  title: Text(chavo.request,
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.2,
                      fontWeight: FontWeight.w600
                    ),
                  ).paddingBottom(8),
                  subtitle: Text(chavo.response,
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.2,
                      // fontWeight: FontWeight.w500
                    ),
                  ).paddingBottom(16),
                )).toList(),
              ) : Container()),
            ),
          ],
        ),
      )
    );
  }
}