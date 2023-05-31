import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';
class New {

  New({
    this.id,
    this.title = "",
    this.content = "",
    this.image,
  });

  int? id;
  String title;
  String content;
  MImage? image;

  factory New.fromJson(Map<String,dynamic> json) => New(
    id: json['id'] != null ? json['id'] as int : null,
    title: json['title'].toString(),
    content: json['content'].toString(),
    image: json['image'] != null ? MImage.fromJson(json['image'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'image': image?.toJson()
  };

  New clone() => New(
    id: id,
    title: title,
    content: content,
    image: image?.clone()
  );


  New copyWith({
    Optional<int?>? id,
    String? title,
    String? content,
    Optional<MImage?>? image
  }) => New(
    id: checkOptional(id, () => this.id),
    title: title ?? this.title,
    content: content ?? this.content,
    image: checkOptional(image, () => this.image),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is New && id == other.id && title == other.title && content == other.content && image == other.image;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ content.hashCode ^ image.hashCode;
}
