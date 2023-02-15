// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/providers/AlertProvider.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({this.alertProvider, Key key}) : super(key: key);
  final alertProvider;

  @override
  State<AlertPage> createState() => _AlertPageState();
}

String _currentTime = '';
String _currentDate = '';
final alerts = [];

class _AlertPageState extends State<AlertPage> {
  String _currentDate = '';
  @override
  void initState() {
    super.initState();

    _getCurrentDate();
  }

  void _getCurrentDate() {
    final DateTime now = DateTime.now();
    final String formattedDate = "${now.month}-${now.day}-${now.year}";
    setState(() {
      _currentDate = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final alertRequest = FutureProvider<Map>(
      (ref) async {
        final response =
            await http.get(Uri.parse('http://localhost:8000/phone_detected/'));
        final extract = jsonDecode(response.body);

        return Future.value(extract);
      },
    );
    return Consumer(
      builder: (context, ref, child) {
        final alertData = ref.watch(alertRequest);
        // final alertSeries = ref.watch(widget.alertProvider);

        alertData.when(
          data: (data) {
            print(data['message']);
            if (data['message']) {
              // alertSeries.addAlert('true');
              alerts.add('value');
            }
          },
          loading: () => Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (e, s) => CircularProgressIndicator(color: Colors.red),
        );
        return Container(
          child: Column(
            children: [
              // ImagePage(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 40),
                    child: Title(
                        color: Colors.black,
                        child: Text('Notifications',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                  ),
                  Spacer()
                ],
              ),
              Container(
                height: 700,
                child: ListView.builder(
                  itemCount: alerts.length,
                  // itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10, bottom: 8, right: 10),
                      padding: EdgeInsets.all(10),
                      height: 85,
                      width: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Distracted Driver',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              Text(
                                'Ben is distracted by his phone!',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text('Date: $_currentDate'),
                            ],
                          ),
                          Icon(
                            Icons.phone_android,
                            size: 50,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
