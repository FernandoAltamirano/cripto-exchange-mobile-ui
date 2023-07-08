import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cripto_exchange_ui/providers/providers.dart';
import 'package:cripto_exchange_ui/theme/current_theme.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';
import 'package:cripto_exchange_ui/modules/modules.dart';
import 'package:provider/provider.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final selectedItem = Provider.of<MenuProvider>(context).selectedItem;
    return Scaffold(
      backgroundColor: CurrentTheme.primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: selectedItem == 'Wallet'
            ? WalletAppBarModule()
            : const HomeAppBarModule(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              controller: ScrollController(),
              child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height +
                        (Platform.isAndroid ? 70 : 80)),
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                child: child,
              )),
          const Positioned(bottom: 20, child: CustomBottomNavigationBar())
        ],
      ),
    );
  }
}
