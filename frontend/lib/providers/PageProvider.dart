// ignore_for_file: file_names
import 'package:flutter/foundation.dart';

class PageViewProvider extends ChangeNotifier {
  int index = 2;
  getPageViewIndex() => index;

  void changePageViewIndex(int changeIndex) {
    index = changeIndex;
    print(index);
    notifyListeners();
  }
}
