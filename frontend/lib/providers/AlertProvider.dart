// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AlertProvider extends ChangeNotifier {
  List alerts = [];

  getAlerts() => alerts;

  void addAlert(String alert) {
    alerts.add(alert);
    notifyListeners();
  }
}
