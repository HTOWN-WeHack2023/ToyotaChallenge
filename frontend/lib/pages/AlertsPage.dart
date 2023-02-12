// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/AlertProvider.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({this.alertProvider, Key? key}) : super(key: key);
  final alertProvider;

  @override
  State<AlertPage> createState() => _AlertPageState();
}

final alerts = [];

class _AlertPageState extends State<AlertPage> {
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
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, s) => CircularProgressIndicator(color: Colors.red),
        );
        return Container(
          child: Column(
            children: [
              // ImagePage(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Title(
                        color: Colors.black,
                        child: Text('Notifications',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  ),
                  Spacer()
                ],
              ),
              Container(
                height: 700,
                child: ListView.builder(
                  itemCount: alerts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10, bottom: 8, right: 10),
                      height: 70,
                      width: 50,
                      child: Text('Item $index'),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
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

// class ImagePage extends StatefulWidget {
//   @override
//   _ImagePageState createState() => _ImagePageState();
// }

// class _ImagePageState extends State<ImagePage> {
//   Future<File> _getImageFile() async {
//     var response =
//         await http.get(Uri.parse("http://localhost:8000/phone_in_frame"));
//     var file = File.fromRawPath(response.bodyBytes);
//     return file;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder<File>(
//         future: _getImageFile(),
//         builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
//           if (snapshot.hasData) {
//             return Image.file(snapshot.data!);
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
