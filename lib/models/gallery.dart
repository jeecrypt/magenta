import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';
class Gallery {

  Gallery({
    this.image,
    this.tag,
  });

  MImage? image;
  GalleryTag? tag;

  factory Gallery.fromJson(Map<String,dynamic> json) => Gallery(
    image: json['image'] != null ? MImage.fromJson(json['image'] as Map<String, dynamic>) : null,
    tag: json['tag'] != null ? GalleryTag.fromJson(json['tag'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'image': image?.toJson(),
    'tag': tag?.toJson()
  };

  Gallery clone() => Gallery(
    image: image?.clone(),
    tag: tag?.clone()
  );


  Gallery copyWith({
    Optional<MImage?>? image,
    Optional<GalleryTag?>? tag
  }) => Gallery(
    image: checkOptional(image, () => this.image),
    tag: checkOptional(tag, () => this.tag),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Gallery && image == other.image && tag == other.tag;

  @override
  int get hashCode => image.hashCode ^ tag.hashCode;
}
