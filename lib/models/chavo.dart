import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';
class Chavo {

  Chavo({
    this.request = "",
    this.response = "",
  });

  String request;
  String response;

  factory Chavo.fromJson(Map<String,dynamic> json) => Chavo(
    request: json['request'].toString(),
    response: json['response'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'request': request,
    'response': response
  };

  Chavo clone() => Chavo(
    request: request,
    response: response
  );


  Chavo copyWith({
    String? request,
    String? response
  }) => Chavo(
    request: request ?? this.request,
    response: response ?? this.response,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Chavo && request == other.request && response == other.response;

  @override
  int get hashCode => request.hashCode ^ response.hashCode;
}
