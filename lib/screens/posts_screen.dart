import 'package:flutter/material.dart';
import 'package:magenta/screens/home_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:magenta/models/index.dart' as m;

class PostsScreen extends StatefulWidget {
  final m.New n;
  const PostsScreen({super.key, required this.n});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
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
          child: Text(widget.n.title,
            style: const TextStyle(
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
                image: DecorationImage(image: NetworkImage(host + widget.n.image!.url),fit: BoxFit.cover)
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(widget.n.content,
                style: const TextStyle(
                  fontSize: 20,
                  height: 1.2
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}