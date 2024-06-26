import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key,
      required this.tiny,
      required this.phone,
      required this.tablet,
      required this.largeTablet,
      required this.computer});

  final Widget tiny;
  final Widget phone;
  final Widget tablet;
  final Widget largeTablet;
  final Widget computer;

  static final int tinyHeightLimit = 100;
  static final int tinyLimit = 270;
  static final int phoneLimit = 800;
  static final int tabletLimit = 800;
  static final int largeTabletLimit = 1100;

  static bool isTinyHeightLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < tinyHeightLimit;
  static bool isTinyLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < tinyLimit;
  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.height < phoneLimit &&
      MediaQuery.of(context).size.height >= tinyLimit;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.height < tabletLimit &&
      MediaQuery.of(context).size.height >= phoneLimit;
  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.height < largeTabletLimit &&
      MediaQuery.of(context).size.height >= tabletLimit;
  static bool isComputer(BuildContext context) =>
      MediaQuery.of(context).size.height >= largeTabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth < tinyLimit || constraints.maxHeight < tinyHeightLimit){
            return tiny;
          }
          if(constraints.maxWidth < phoneLimit){
            return phone;
          }
          if(constraints.maxWidth < tabletLimit){
            return tablet;
          }
          if(constraints.maxWidth < largeTabletLimit){
            return largeTablet;
          }else{
            return computer;
          }
        });
  }
}
