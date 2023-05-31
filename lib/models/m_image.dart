import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';
class MImage {

  MImage({
    this.id,
    this.url = "",
  });

  int? id;
  String url;

  factory MImage.fromJson(Map<String,dynamic> json) => MImage(
    id: json['id'] != null ? json['id'] as int : null,
    url: json['url'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'url': url
  };

  MImage clone() => MImage(
    id: id,
    url: url
  );


  MImage copyWith({
    Optional<int?>? id,
    String? url
  }) => MImage(
    id: checkOptional(id, () => this.id),
    url: url ?? this.url,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is MImage && id == other.id && url == other.url;

  @override
  int get hashCode => id.hashCode ^ url.hashCode;
}
