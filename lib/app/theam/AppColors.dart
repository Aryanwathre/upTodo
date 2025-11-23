import 'package:flutter/material.dart';

class AppColor {
  static final primaryColor =  _hexToColor('#8685E7');
  static final secondaryColor =  _hexToColor('#4CAF50');
  static final backgroundColor =  _hexToColor('#F5F5F5');
  static final DarktextColor =  _hexToColor('#212121');
  static final LighttextColor =  _hexToColor('#FFFFFF');
  static final borderColor =  _hexToColor('#E0E0E0');
  static final iconColor =  _hexToColor('#757575');
  static final buttonColor =  _hexToColor('#FF9800');
  static final errorColor =  _hexToColor('#F44336');
  static final successColor =  _hexToColor('#4CAF50');
  static final warningColor =  _hexToColor('#FFC107');
  static final whiteColor =  _hexToColor('#FFFFFF');
  static final blackColor =  _hexToColor('#000000');
  static final blackColor54 =  _hexToColor('#000000').withOpacity(0.54);
  static final blackColor87 =  _hexToColor('#000000').withOpacity(0.87);


}

Color _hexToColor(String hexString) {
  final buffer = StringBuffer();

  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');

  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}