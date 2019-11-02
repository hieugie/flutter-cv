import 'package:flutter/cupertino.dart';

class IndexProvider with ChangeNotifier {
  int index;
  IndexProvider(this.index);

  getIndex() => index;
  setIndex(int index) => this.index = index;

  changeIndex(index) {
    this.index = index;
    notifyListeners();
  }
}
