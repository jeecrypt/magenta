import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magenta/widgets/library_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'home_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  Controller controller = Get.find();

  @override
  void initState() {
    controller.getGalleryTags();
    controller.getGallery();
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
            color: Colors.black,
          ),
          child: const Text('Галерея',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() => controller.tags.isNotEmpty ? Wrap(
                children: controller.tags.map((tag) => AppButton(
                    onTap: (){
                      setState(() {
                        for (int i = 0; i < controller.tags.length; i++) {
                          if(tag.name == controller.tags[i].name){
                            controller.tags[i].selected = !(controller.tags[i].selected??false);
                          } else {
                            controller.tags[i].selected = false;
                          }
                        }
                      });
                      controller.getGallery(
                        tag: tag.selected == true ? tag.name : ''
                      );
                    },
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabled: true,
                    margin: const EdgeInsets.only(left: 16,right: 8,top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 38,
                    elevation: 0,
                    disabledColor: Colors.white38,
                    color: tag.selected??false ? Color(0xffE468C9) : Colors.black12,
                    text: tag.name,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: tag.selected??false ? Colors.white : Colors.black
                    )
                  )).toList()
              ) : Container()) 
            ),
            Obx(() => controller.galleries.isNotEmpty ? Column(
              children: controller.galleries.map((element) => LibraryWidget(
                imageUrl: host + element.image!.url,
                tag: element.tag!.name,
              )).toList()
            ) : Container())
          ]
        ),
      )
    );
  }
}