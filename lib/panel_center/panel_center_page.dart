import 'package:flutter/material.dart';

import '../constants.dart';
import 'linear_graph.dart';

class Person {
  String name;
  Color color;
  Person({required this.name, required this.color});
}

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({super.key});

  @override
  State<PanelCenterPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelCenterPage> {
  List<Person> _persons = [
    Person(name: "Theia Bowen", color: Constants.orangeLight),
    Person(name: "Fariha Odling", color: Constants.redLight),
    Person(name: "Viola Willis", color: Constants.blueLight),
    Person(name: "Emmett Forrest", color: Constants.orangeLight),
    Person(name: "Nick Jarvis", color: Constants.greenLight),
    Person(name: "Amit Clayeia", color: Constants.orangeLight),
    Person(name: "Amalie Howardeia", color: Constants.redLight),
    Person(name: "Campbell Britton", color: Constants.blueLight),
    Person(name: "Haley Mellor", color: Constants.redLight),
    Person(name: "Harlen Higgins", color: Constants.greenLight),
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
                      "Products Available",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "82% of the Products Avail.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Chip(
                      label: Text(
                        "20,500",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            BarChartSample2(),

            Padding(
              padding: EdgeInsets.only(
                bottom: Constants.kPadding,
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: List.generate(
                    _persons.length,
                    (index) => ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        child: Text(
                          _persons[index].name.substring(0, 1),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: _persons[index].color,
                      ),
                      title: Text(
                        _persons[index].name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
