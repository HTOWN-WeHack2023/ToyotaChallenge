import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  FindPage({Key? key}) : super(key: key);

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .8,
      child: Column(children: []),
    );
  }
}
