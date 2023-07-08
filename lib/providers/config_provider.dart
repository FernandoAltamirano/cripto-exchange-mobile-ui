import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  String walletCategoryActive = "Deposit";
  String marketCategoryActive = "Favorites";
  bool cardDetailsisHidden = false;

  setWalletCategoryActive(String category) {
    walletCategoryActive = category;
    notifyListeners();
  }

  setMarketCategoryActive(String category) {
    marketCategoryActive = category;
    notifyListeners();
  }

  toggleCardDetailsIsHidden() {
    cardDetailsisHidden = !cardDetailsisHidden;
    notifyListeners();
  }
}
