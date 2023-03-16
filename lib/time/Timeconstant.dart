import 'package:flutter/material.dart';


var currentTime = DateTime.now().hour;

class ConstantColors {
  static const backgroundColor = Colors.black;
  static const titleColor = Colors.white;
  static const containerColor = Colors.grey;
}

String greetings() {
  if (currentTime > 6 && currentTime < 12) {
    return "Good Morning";
  } else if (currentTime > 12 && currentTime < 17) {
    return "Good Afternoon";
  }
  return "Good Evening";
}
