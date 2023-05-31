import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';
class GalleryTag {

  GalleryTag({
    this.name = "",
    this.selected,
  });

  String name;
  bool? selected;

  factory GalleryTag.fromJson(Map<String,dynamic> json) => GalleryTag(
    name: json['name'].toString(),
    selected: json['selected'] != null ? json['selected'] as bool : null
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'selected': selected
  };

  GalleryTag clone() => GalleryTag(
    name: name,
    selected: selected
  );


  GalleryTag copyWith({
    String? name,
    Optional<bool?>? selected
  }) => GalleryTag(
    name: name ?? this.name,
    selected: checkOptional(selected, () => this.selected),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is GalleryTag && name == other.name && selected == other.selected;

  @override
  int get hashCode => name.hashCode ^ selected.hashCode;
}
