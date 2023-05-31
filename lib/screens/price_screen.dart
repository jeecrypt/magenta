import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magenta/screens/home_screen.dart';
import 'package:nb_utils/nb_utils.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  Controller c = Get.find();

  @override
  void initState() {
    super.initState();
    c.getPrice();
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
            color: const Color(0xff949CEB),
          ),
          child: const Text("Услуги и цены",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
      body: Obx(() => c.price.isNotEmpty ? ListView(
        children: c.price.map((price) => ListTile(
          title: Text(price.name),
          trailing: Text("${price.price}₽"),
        )).toList(),
      ) : Container()) ,
    );
  }
}