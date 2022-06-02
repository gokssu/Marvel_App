import 'package:flutter/material.dart';

class PaddingConstants {
  static PaddingConstants instance = PaddingConstants._init();
  PaddingConstants._init();

  final allPadding = EdgeInsets.all(10);
  final allMinPadding = EdgeInsets.all(5);
  final onlyTop = EdgeInsets.only(top: 10);
  final onlyLeft = EdgeInsets.only(left: 10);
  final onlyRight = EdgeInsets.only(right: 10);
  final onlyBottom = EdgeInsets.only(bottom: 10);
  final onlyTopMin = EdgeInsets.only(top: 5);
  final onlyLeftMin = EdgeInsets.only(left: 5);
  final onlyRightMin = EdgeInsets.only(right: 5);
  final onlyBottomMin = EdgeInsets.only(bottom: 5);
}
