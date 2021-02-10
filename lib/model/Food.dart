import 'package:flutter/cupertino.dart';

class Foods {
  String image, name, price, quentety, color1, color2, description;
  int id, quan;
  Foods(id, image, name, price, quentety, color1, color2, description, quan) {
    this.id = id;
    this.image = image;
    this.name = name;
    this.price = price;
    this.quentety = quentety;
    this.color1 = color1;
    this.color2 = color2;
    this.description = description;
    this.quan = quan;
  }
}
