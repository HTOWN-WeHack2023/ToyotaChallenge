import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .8,
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '2012 Camry',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              // ignore: prefer_const_constructors
              SizedBox(width: 110),
              IconButton(
                onPressed: (() {}),
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.dark_mode_outlined,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: (() {}),
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.person_outline_outlined,
                  size: 40,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
