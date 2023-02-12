import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final accountBalanceData = FutureProvider<Map>(
  (ref) async {
    // String apiUrl = '127.0.0.1:8000';
    // String apiUrl = '173.255.195.217:8080';
    final response = await http.get(Uri.parse(''));
    final extract = jsonDecode(response.body);
    return Future.value(extract);
  },
);
