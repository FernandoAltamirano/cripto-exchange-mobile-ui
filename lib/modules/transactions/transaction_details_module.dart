import 'package:cripto_exchange_ui/modules/modules.dart';
import 'package:flutter/material.dart';

class TransactionDetailsModule extends StatelessWidget {
  const TransactionDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialogLayout(
        child: Column(
      children: [Text("Transaction details")],
    ));
  }
}
