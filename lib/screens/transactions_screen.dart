import 'package:cripto_exchange_ui/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:cripto_exchange_ui/providers/providers.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);
    return Column(
      children: [
        HorizontalScrollItems(
            onTap: (e) {
              configProvider.setWalletCategoryActive(e);
            },
            selectedCategory: configProvider.walletCategoryActive,
            categories: const [
              "Deposit",
              "Withdraw",
              "Transfer",
              "Earn",
              "Transactions"
            ]),
        const SizedBox(height: 40),
        const CardModule(),
        const SizedBox(height: 40),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: AmountConfigModule(),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 70),
          child: TransactionsListModule(),
        )
      ],
    );
  }
}
