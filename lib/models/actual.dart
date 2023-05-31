import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';
class Actual {

  Actual({
    this.title = "",
    this.contant = "",
    this.image = const [],
  });

  String title;
  String contant;
  List<MImage> image;

  factory Actual.fromJson(Map<String,dynamic> json) => Actual(
    title: json['title'].toString(),
    contant: json['contant'].toString(),
    image: (json['image'] as List? ?? []).map((e) => MImage.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'title': title,
    'contant': contant,
    'image': image.map((e) => e.toJson()).toList()
  };

  Actual clone() => Actual(
    title: title,
    contant: contant,
    image: image.map((e) => e.clone()).toList()
  );


  Actual copyWith({
    String? title,
    String? contant,
    List<MImage>? image
  }) => Actual(
    title: title ?? this.title,
    contant: contant ?? this.contant,
    image: image ?? this.image,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Actual && title == other.title && contant == other.contant && image == other.image;

  @override
  int get hashCode => title.hashCode ^ contant.hashCode ^ image.hashCode;
}
