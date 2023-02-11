import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/ThemeProvider.dart';

class SettingPage extends StatefulWidget {
  SettingPage(this.themeProvider, {Key? key}) : super(key: key);

  final themeProvider;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    // final themeProvider = ChangeNotifierProvider<ThemeProviderNotifier>(
    //   (ref) {
    //     return ThemeProviderNotifier();
    //   },
    // );

    return Consumer(
      builder: ((context, ref, child) {
        final themeState = ref.watch(widget.themeProvider);

        return Container(
            padding: EdgeInsets.only(top: 100, left: 20),
            color: themeState.appTheme == CustomTheme.light
                ? Colors.white
                : Colors.grey[800],
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
                      child: Text('Click Me'),
                      onPressed: () {
                        setState(
                          () {
                            themeState.changeTheme(
                                themeState.getTheme() == CustomTheme.dark
                                    ? CustomTheme.light
                                    : CustomTheme.dark);
                          },
                        );
                      },
                    ),
                  ],
                )
              ],
            ));
      }),
    );
  }
}
