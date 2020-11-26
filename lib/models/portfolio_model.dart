import 'package:flutter/cupertino.dart';

class PortfolioData {
  String title;
  String description;
  String icon;
  int counter = 0;
  double percentageValue = 0.0;
  bool isPositive = true;

  PortfolioData({
    @required this.title,
    @required this.description,
    this.counter,
    @required this.icon,
    @required this.isPositive,
    this.percentageValue,
  });
}
