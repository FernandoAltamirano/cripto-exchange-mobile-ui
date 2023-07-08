import 'package:flutter/cupertino.dart';

class MenuProvider extends ChangeNotifier {
  String selectedItem = "Splash";

  setSelectedItem(String item) {
    selectedItem = item;
    notifyListeners();
  }
}
