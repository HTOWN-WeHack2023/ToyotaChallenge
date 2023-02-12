// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

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
              Icon(Icons.arrow_drop_down),
              // ignore: prefer_const_constructors
              SizedBox(width: 120),
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
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Row(
                children: [
                  Icon(Icons.local_gas_station_outlined),
                  const Text(
                    '200',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'mi',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  //
                  //
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Row(children: [
                const Text(
                  'Distance to empty',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: 250,
          height: 150,
          child: Image.asset('assets/camry.png'),
        ),
        Stack(children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.lock_open_rounded,
                    size: 50.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.power_settings_new,
                    size: 50.0,
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.lock_outline_rounded,
                    size: 50.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              ],
            ),
          ),
        ]),
        Container(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 25, 20, 0),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Divider(color: Colors.grey[700]),
                        width: 350,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.grey,
                            // ),
                            borderRadius: BorderRadius.circular(
                                10) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                        height: 75.0,
                        width: 375,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  .0,
                                  2.0,
                                ),
                                blurRadius: .5,
                                spreadRadius: .6,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: Icon(
                                  Icons.car_repair_outlined,
                                  color: Colors.blue[900],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Vehicle Status",
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Closed and locked",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.grey,
                            // ),
                            borderRadius: BorderRadius.circular(
                                10) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                        height: 75.0,
                        width: 375,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  .0,
                                  2.0,
                                ),
                                blurRadius: .5,
                                spreadRadius: .6,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: Icon(
                                  Icons.notifications_active_outlined,
                                  color: Colors.blue[900],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Health & Alerts",
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "No recalls or vehicle alerts ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.grey,
                            // ),
                            borderRadius: BorderRadius.circular(
                                10) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                        height: 75.0,
                        width: 375,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  .0,
                                  2.0,
                                ),
                                blurRadius: .5,
                                spreadRadius: .6,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.blue[900],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Service Appointments",
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Maintenance up to date ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
