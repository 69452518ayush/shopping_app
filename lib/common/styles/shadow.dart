import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class UShadow {
  UShadow._();

  static List<BoxShadow> searchBarShadow = [
    BoxShadow(
      color: UColors.black.withValues(alpha: 0.1),
      spreadRadius: 4.0,
      blurRadius: 4.0,
    ),
  ];
}
