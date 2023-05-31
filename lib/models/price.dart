import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';
class Price {

  Price({
    this.name = "",
    this.price = "",
  });

  String name;
  String price;

  factory Price.fromJson(Map<String,dynamic> json) => Price(
    name: json['name'].toString(),
    price: json['price'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price
  };

  Price clone() => Price(
    name: name,
    price: price
  );


  Price copyWith({
    String? name,
    String? price
  }) => Price(
    name: name ?? this.name,
    price: price ?? this.price,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Price && name == other.name && price == other.price;

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}
