import 'package:flutter/material.dart';

class Global{
  static Color bg1Color = const Color(0xffE88D67);
  static Color bg2Color = const Color(0xffBB999C);
  static Color bg3Color = const Color(0xff8B8BB3);
  static Color bg4Color = const Color(0xff7B8CDE);
  static Color bg5Color = const Color(0xffC0E6DE);

  static String country = "In";
  static String title = "India";
  static String search = "Surat";
  static Color color1 = Colors.white;

  static searchData(){
    if(country == "In")
    {
      search = "Surat";
      title = "India";
    }
    else if(country == "UK")
    {
      search = "London";
      title = "United Kingdom";
    }
    else if(country == "RU")
    {
      search = "Moscow";
      title = "Russia";
    }
    else
    {
      search = "nantes";
      title = "France";
    }
  }

  static List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
}