import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cripto_exchange_ui/providers/providers.dart';
import 'package:cripto_exchange_ui/screens/screens.dart';
import 'package:cripto_exchange_ui/modules/modules.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MenuProvider()),
      ChangeNotifierProvider(create: (_) => WalletProvider()),
      ChangeNotifierProvider(create: (_) => ConfigProvider()),
    ], child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto Exchange',
        home: Builder(builder: (context) {
          final selectedItem = Provider.of<MenuProvider>(context).selectedItem;
          if (selectedItem == "Home") {
            return const AuthLayout(child: HomeScreen());
          }
          if (selectedItem == "Market") {
            return const AuthLayout(child: MarketScreen());
          }
          if (selectedItem == "Wallet") {
            return const AuthLayout(child: WalletScreen());
          }
          if (selectedItem == "Transactions") {
            return const AuthLayout(child: TransactionsScreen());
          }
          if (selectedItem == "Trade") {
            return const AuthLayout(child: TradeScreen());
          }
          return const SplashScreen();
        }));
  }
}
