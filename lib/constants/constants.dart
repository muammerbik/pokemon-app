import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();
  static const String title = 'Pokedex';
  static TextStyle getTitleTextStyle() {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 48);
  }

  static TextStyle getPokeNameTextStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold);
  }

  static TextStyle getchipTextStyle() {
    return TextStyle(color: Colors.white, fontSize: 20);
  }

  static TextStyle getInfoLabelTextStyle() {
    return TextStyle(fontSize: 20.h,fontWeight: FontWeight.bold,color: Colors.black);
  }
  static TextStyle getInfoValueTextStyle() {
    return TextStyle(fontSize: 18.h,color: Colors.black);
  }
  
}
