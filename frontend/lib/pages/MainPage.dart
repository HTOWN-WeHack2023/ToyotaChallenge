// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/pages/DashboardPage.dart';
import 'package:frontend/pages/FindPage.dart';
import 'package:frontend/providers/PageProvider.dart';
import 'package:frontend/providers/ThemeProvider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _SettingsPageState();
}

final themeProvider = ChangeNotifierProvider<ThemeProviderNotifier>(
  (ref) {
    return ThemeProviderNotifier();
  },
);

class _SettingsPageState extends State<MainPage> {
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  // final dockColor = themeState.appTheme == CustomTheme.light
  //     ? Colors.grey[200]
  //     : Colors.grey[900];
  @override
  Widget build(BuildContext context) {
    final pageViewProvider = ChangeNotifierProvider<PageViewProvider>(
      (ref) {
        return PageViewProvider();
      },
    );

    return Consumer(
      builder: (context, ref, child) {
        final themeState = ref.watch(themeProvider);

        return Scaffold(
          body: Consumer(
            builder: (context, ref, child) {
              final pageController = ref.watch(pageViewProvider);

              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  pageController.getPageViewIndex() == 1
                      ? FindPage()
                      : DashboardPage(),
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
                              Column(
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
                                        child: Icon(
                                          Icons.car_crash_rounded,
                                          size: 35,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),
                              // Find Button
                              Column(
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
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}


// Consumer(
                  //   builder: ((context, ref, child) {
                  //     print(
                  //         'CURRENT PAGE : ${pageController.getPageViewIndex()}');
                  //     switch (pageController.getPageViewIndex()) {
                  //       case 1:
                  //         return FindPage();

                  //       case 2:
                  //         return DashboardPage();

                  //       case 3:
                  //         return FindPage();

                  //       default:
                  //         return DashboardPage();
                  //     }
                  //   }),
                  // ),

// backgroundColor: Colors.grey,
// body: PageView(
//   physics: const NeverScrollableScrollPhysics(),
//   controller: pageController,
//   children: <Widget>[
//     SettingPage(themeProvider),
//   ],
// ),
// bottomNavigationBar: WaterDropNavBar(
//   backgroundColor: Colors.grey[600]!,
//   waterDropColor: themeState.appTheme == CustomTheme.light
//       ? Colors.white
//       : Colors.grey[800]!,
//   onItemSelected: (int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//     pageController.animateToPage(selectedIndex,
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.easeOutQuad);
//   },
//   selectedIndex: selectedIndex,
//   barItems: <BarItem>[
//     BarItem(
//       outlinedIcon: Icons.handyman_outlined,
//       filledIcon: Icons.handyman_rounded,
//     ),
//     BarItem(
//         outlinedIcon: Icons.monetization_on_outlined,
//         filledIcon: Icons.monetization_on),
//     BarItem(
//       filledIcon: Icons.store_rounded,
//       outlinedIcon: Icons.store_outlined,
//     ),
//     BarItem(
//       outlinedIcon: Icons.location_on_outlined,
//       filledIcon: Icons.location_on_sharp,
//     ),
//   ],
// ),
