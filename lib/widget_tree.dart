import 'package:admin_panel/app_bar/app_bar_widget.dart';
import 'package:admin_panel/constants.dart';
import 'package:admin_panel/drawer/drawer_page.dart';
import 'package:admin_panel/panel_center/panel_center_page.dart';
import 'package:admin_panel/panel_left/panel_left_page.dart';
import 'package:admin_panel/panel_right/panel_right_page.dart';
import 'package:admin_panel/responsive_layout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;

  List<Widget> _icons = [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context)
            ? Container()
            : AppBarWidget()),
        preferredSize: Size(double.infinity, 100),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? PanelLeftPage()
            : currentIndex == 1
                ? PanelCenterPage()
                : PanelRightPage(),
        tablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
        computer: Row(
          children: [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
      ),
      drawer: DrawerPage(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: currentIndex,
              backgroundColor: Constants.purpleDark,
              items: <Widget>[
                Icon(Icons.add, size: 30),
                Icon(Icons.list, size: 30),
                Icon(Icons.compare_arrows, size: 30),
              ],
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ) : SizedBox(),
    );
  }
}
