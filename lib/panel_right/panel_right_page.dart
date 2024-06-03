import 'package:admin_panel/panel_right/wiggle_graph.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Product {
  String name;
  bool enable;
  Product({required this.name, required this.enable});
}

class PanelRightPage extends StatefulWidget {
  const PanelRightPage({super.key});

  @override
  State<PanelRightPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelRightPage> {
  List<Product> _products = [
    Product(name: "LED Submersible Light", enable: true),
    Product(name: "Portable Projector", enable: true),
    Product(name: "Bluetooth Speaker", enable: true),
    Product(name: "Smart Watch", enable: true),
    Product(name: "Temporary Tattoos", enable: true),
    Product(name: "Bookends", enable: true),
    Product(name: "Vegetable Chopper", enable: true),
    Product(name: "Neck Massager", enable: true),
    Product(name: "Facial Cleaner", enable: true),
    Product(name: "Back Cushion", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Constants.kPadding / 2,
              right: Constants.kPadding / 2,
              top: Constants.kPadding / 2,
            ),
            child: Card(
              color: Constants.purpleLight,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                width: double.infinity,
                child: ListTile(
                  title: Text(
                    "Net Revenue",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "7% of Sales Avg.",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Chip(
                    label: Text(
                      r"$46,450",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),

          LineChartSample1(),

          Padding(
            padding: EdgeInsets.only(
              left: Constants.kPadding / 2,
              right: Constants.kPadding / 2,
              top: Constants.kPadding,
              bottom: Constants.kPadding,
            ),
            child: Card(
              color: Constants.purpleLight,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: List.generate(
                  _products.length,
                  (index) => SwitchListTile.adaptive(
                    title: Text(_products[index].name,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: _products[index].enable,
                    onChanged: (newValue){
                      setState(() {
                        _products[index].enable = newValue;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
