import 'package:flutter/material.dart';
import 'package:thesocail/constant/Constantcolors%20(1).dart';

class HomePage extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.redColor,
    );
  }
}
