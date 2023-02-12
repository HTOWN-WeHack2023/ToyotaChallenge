import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/pages/MainPage.dart';
import 'package:frontend/providers/ThemeProvider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialAppWithTheme(),
    ),
  );
}

final themeProvider = ChangeNotifierProvider<ThemeProviderNotifier>(
  (ref) {
    return ThemeProviderNotifier();
  },
);

class MaterialAppWithTheme extends ConsumerWidget {
  const MaterialAppWithTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'home': (context) => MainPage()},
      title: 'Toyota App',
      theme: themeState.appTheme == CustomTheme.light
          ? ThemeData(
              buttonTheme: const ButtonThemeData(buttonColor: Colors.amber),
              primarySwatch: Colors.blueGrey,
              backgroundColor: Colors.grey[400],
            )
          : ThemeData(
              buttonTheme: const ButtonThemeData(buttonColor: Colors.black),
              primaryColor: Colors.grey[800],
              backgroundColor: Colors.grey[700],
            ),
      home: const MyHomePage(title: 'Toyota'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}
