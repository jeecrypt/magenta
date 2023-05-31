import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:magenta/models/index.dart' as m;

import '../screens/home_screen.dart';

class NewsWidget extends StatelessWidget {
  final m.New n;

  const NewsWidget({super.key, required this.n});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16,top: 8,right: 16,bottom: 4),
      height: 264,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            offset: Offset.fromDirection(8, 4)
          ),
        ],
        border: Border.all(color: Colors.black),
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 4),
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: NetworkImage(host + n.image!.url),fit: BoxFit.cover)
            ),
          ),
          Wrap(
            children: [
              Text(n.title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              ).paddingLeft(12),
            ],
          )
        ],
      ),
    );
  }
}