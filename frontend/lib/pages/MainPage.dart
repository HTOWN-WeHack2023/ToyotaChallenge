// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/pages/AlertsPage.dart';
import '/pages/DashboardPage.dart';
import '/pages/FindPage.dart';
import '/providers/AlertProvider.dart';
import '/providers/MapControlProvider.dart';
import '/providers/PageProvider.dart';
import '/providers/ThemeProvider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

final themeProvider = ChangeNotifierProvider<ThemeProviderNotifier>(
  (ref) {
    return ThemeProviderNotifier();
  },
);

final pageViewProvider = ChangeNotifierProvider<PageViewProvider>(
  (ref) {
    return PageViewProvider();
  },
);

final mapControllerProvider = ChangeNotifierProvider<MapControlProvider>(
  (ref) {
    return MapControlProvider();
  },
);

final alertProvider = ChangeNotifierProvider<AlertProvider>((ref) {
  return AlertProvider();
});

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeState = ref.watch(themeProvider);
        final pageController = ref.watch(pageViewProvider);

        print('Current page index: ${pageController.index}');

        return Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            pageController.index == 1
                ? AlertPage()
                : pageController.index == 2
                    ? DashboardPage()
                    : FindPage(
                        mapProvider: mapProvider,
                        pageController: pageController),
            // ),
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Assist Button
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    pageController.changePageViewIndex(1);
                                  });
                                },
                                icon: Icon(
                                  Icons.notifications_none,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Alerts',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        // Dash Button Button
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            InkWell(
                                onTap: (() {
                                  setState(() {
                                    pageController.changePageViewIndex(2);
                                  });
                                }),
                                child: CircleAvatar(
                                  minRadius: 35,
                                  backgroundColor: Colors.red,
                                  child: Container(
                                    height: 40,
                                    child: Image.asset(
                                      "assets/car.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        // Find Button
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    pageController.changePageViewIndex(3);
                                  });
                                },
                                icon: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Find',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
      },
    );
  }
}
