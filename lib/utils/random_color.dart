import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_banking_app/utils/constants.dart';

Color randomColor() {
  final List<Color> colorCollection = <Color>[];
  final _random = Random();
  colorCollection.add(kPurpleColor);
  colorCollection.add(kPinkColor);
  colorCollection.add(kYellowColor);
  colorCollection.add(kBlueColor);
  colorCollection.add(kPrimaryColor);
  return colorCollection[_random.nextInt(colorCollection.length)];
}

Color randomProfileBgColor() {
  final List<Color> colorCollection = <Color>[];
  final _random = Random();
  colorCollection.add(kPinkColor);
  colorCollection.add(Colors.blueAccent);
  colorCollection.add(kPrimaryDarkColor);
  return colorCollection[_random.nextInt(colorCollection.length)];
}
