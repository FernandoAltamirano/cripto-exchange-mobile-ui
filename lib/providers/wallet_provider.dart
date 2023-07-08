import 'package:flutter/material.dart';

class WalletProvider extends ChangeNotifier {
  bool isHidden = false;

  toggleHidden() {
    isHidden = !isHidden;
    notifyListeners();
  }
}
