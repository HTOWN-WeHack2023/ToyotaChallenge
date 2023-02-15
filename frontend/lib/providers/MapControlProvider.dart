import 'package:flutter/material.dart';
// ignore_for_file: file_names

class MapControlProvider extends ChangeNotifier {
  bool updateMap = false;
  Map point = {};
  getPointUpdate() => point;
  isRedirected() => updateMap;

  void triggerLocate() {
    updateMap = true;
    point = {'x': 32.99841855227305, 'y': -96.69827427111993};
    notifyListeners();
  }
}
