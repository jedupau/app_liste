import 'package:flutter/cupertino.dart';

class User {
  final String name;
  final String role;
  final String imgUrl;
  final String bio;
  bool isLiked;
  bool isSwipedOff;

  User({
    required this.role,
    required this.name,
    required this.imgUrl,
    required this.bio,
    this.isLiked = false,
    this.isSwipedOff = false,
  });
}
