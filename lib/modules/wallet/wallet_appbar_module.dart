import 'package:flutter/material.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';

// ignore: must_be_immutable
class WalletAppBarModule extends StatelessWidget {
  WalletAppBarModule({
    super.key,
  });

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      bgColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(
          'My Wallet',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
    );
  }
}
