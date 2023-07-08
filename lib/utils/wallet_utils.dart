import 'package:cripto_exchange_ui/mocks/wallet_data.dart';

class WalletUtils {
  static calculatePercentageByAmount(double amount, String symbol) {
    double total = 0;
    double selectedNotional = 0;
    walletData.forEach((element) {
      if (symbol == element["symbol"]) {
        selectedNotional = element["notionalValue"] as double;
      }
      final totalCurrency =
          (element["amount"] as double) * (element["notionalValue"] as double);
      total += totalCurrency;
    });
    return (amount * selectedNotional / total) * 100;
  }

  static calculateWalletTotalInBTC() {
    double total = 0;
    double selectedNotional = 0;
    walletData.forEach((element) {
      if (element["symbol"] == "BTC") {
        selectedNotional = element["notionalValue"] as double;
      }
      final totalCurrency =
          (element["amount"] as double) * (element["notionalValue"] as double);
      total += totalCurrency;
    });
    return total / selectedNotional;
  }

  static calculateWalletTotal() {
    double total = 0;
    walletData.forEach((element) {
      final totalCurrency =
          (element["amount"] as double) * (element["notionalValue"] as double);
      total += totalCurrency;
    });
    return total;
  }
}
