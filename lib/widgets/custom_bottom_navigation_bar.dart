import 'package:cripto_exchange_ui/theme/current_theme.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:cripto_exchange_ui/providers/providers.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 80,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              child: BgBlur(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        menuProvider.setSelectedItem("Home");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: menuProvider.selectedItem == 'Home'
                              ? const [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 2, 251, 255),
                                      blurRadius: 40,
                                      spreadRadius: 0)
                                ]
                              : const [],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            menuProvider.selectedItem == 'Home'
                                ? SvgPicture.asset(
                                    "assets/icons/home-active.svg",
                                  )
                                : SvgPicture.asset(
                                    "assets/icons/home.svg",
                                  ),
                            const SizedBox(height: 3),
                            Text(
                              "Home",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: menuProvider.selectedItem == 'Home'
                                      ? const Color(0xff02FBFF)
                                      : CurrentTheme.textColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        menuProvider.setSelectedItem("Market");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: menuProvider.selectedItem == 'Market'
                              ? const [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 2, 251, 255),
                                      blurRadius: 40,
                                      spreadRadius: 0)
                                ]
                              : const [],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            menuProvider.selectedItem == 'Market'
                                ? SvgPicture.asset(
                                    "assets/icons/market-active.svg",
                                  )
                                : SvgPicture.asset(
                                    "assets/icons/market.svg",
                                  ),
                            const SizedBox(height: 3),
                            Text(
                              "Market",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: menuProvider.selectedItem == 'Market'
                                      ? const Color(0xff02FBFF)
                                      : CurrentTheme.textColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      padding: const EdgeInsets.only(left: 20, top: 26),
                      child: const Text(
                        "Trade",
                        style: TextStyle(
                            fontSize: 11, color: CurrentTheme.textColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        menuProvider.setSelectedItem("Transactions");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: menuProvider.selectedItem == 'Transactions'
                              ? const [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 2, 251, 255),
                                      blurRadius: 40,
                                      spreadRadius: 0)
                                ]
                              : const [],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            menuProvider.selectedItem == 'Transactions'
                                ? SvgPicture.asset(
                                    "assets/icons/futures-active.svg",
                                  )
                                : SvgPicture.asset(
                                    "assets/icons/futures.svg",
                                  ),
                            const SizedBox(height: 3),
                            Text(
                              "Transactions",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: menuProvider.selectedItem ==
                                          'Transactions'
                                      ? const Color(0xff02FBFF)
                                      : CurrentTheme.textColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        menuProvider.setSelectedItem("Wallet");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: menuProvider.selectedItem == 'Wallet'
                              ? const [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 2, 251, 255),
                                      blurRadius: 40,
                                      spreadRadius: 0)
                                ]
                              : const [],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            menuProvider.selectedItem == 'Wallet'
                                ? SvgPicture.asset(
                                    "assets/icons/wallet-active.svg",
                                  )
                                : SvgPicture.asset(
                                    "assets/icons/wallet.svg",
                                  ),
                            const SizedBox(height: 3),
                            Text(
                              "Wallet",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: menuProvider.selectedItem == 'Wallet'
                                      ? const Color(0xff02FBFF)
                                      : CurrentTheme.textColor),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.43,
              top: 20,
              child: const TradeButton())
        ],
      ),
    );
  }
}
