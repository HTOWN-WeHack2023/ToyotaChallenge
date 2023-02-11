// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/pages/SettingsPage.dart';
import 'package:frontend/providers/ThemeProvider.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeState = ref.watch(themeProvider);

        final dockColor = themeState.appTheme == CustomTheme.light
            ? Colors.grey[200]
            : Colors.grey[900];
        return Scaffold(
          // backgroundColor: Colors.grey,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: <Widget>[
              SettingPage(themeProvider),
            ],
          ),
          bottomNavigationBar: WaterDropNavBar(
            backgroundColor: Colors.grey[600]!,
            waterDropColor: themeState.appTheme == CustomTheme.light
                ? Colors.white
                : Colors.grey[800]!,
            onItemSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
              pageController.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
            },
            selectedIndex: selectedIndex,
            barItems: <BarItem>[
              BarItem(
                outlinedIcon: Icons.settings_applications_outlined,
                filledIcon: Icons.settings_applications_rounded,
              ),
              BarItem(
                  filledIcon: Icons.favorite_rounded,
                  outlinedIcon: Icons.favorite_border_rounded),
              BarItem(
                filledIcon: Icons.email_rounded,
                outlinedIcon: Icons.email_outlined,
              ),
              BarItem(
                filledIcon: Icons.folder_rounded,
                outlinedIcon: Icons.folder_outlined,
              ),
            ],
          ),
        );
      },
    );
  }
}
