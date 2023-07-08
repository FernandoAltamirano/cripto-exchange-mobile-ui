import 'package:flutter/material.dart';
import 'package:cripto_exchange_ui/modules/modules.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewsModule(),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: InfoCardsModule(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: MarketCategoriesModule(),
        )
      ],
    );
  }
}
