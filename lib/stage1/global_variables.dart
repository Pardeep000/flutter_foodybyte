import 'package:flutter/material.dart';

class variables {
  late String global_user_name;
  late String global_user_mail;
  //
  late String global_image;
  late String global_name;
  late String global_desc;
  late String global_price;
  //
  late int cart_no;
  late List cart_items;
  late bool display;

  variables({
    required this.global_user_name,
    required this.global_user_mail,
    required this.global_image,
    required this.global_name,
    required this.global_desc,
    required this.global_price,
    required this.cart_no,
    required this.cart_items,
    required this.display,
  });
}

final global_var = [
  variables(
    global_user_name: 'max',
    global_user_mail: 'max_@yahoo.com',
    global_image: '',
    global_name: '',
    global_desc: '',
    global_price: '',
    cart_no: 0,
    cart_items: [],
    display: false,
  ),
];
