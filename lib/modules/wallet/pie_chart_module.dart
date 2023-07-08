import 'package:cripto_exchange_ui/theme/current_theme.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cripto_exchange_ui/providers/providers.dart';
import 'package:cripto_exchange_ui/utils/wallet_utils.dart';
import 'package:cripto_exchange_ui/mocks/wallet_data.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';

class PieChartModule extends StatelessWidget {
  const PieChartModule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.38,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              PieChart(
                PieChartData(
                  sectionsSpace: 5,
                  centerSpaceRadius: 125,
                  sections: [
                    ...walletData.map((e) => PieChartSectionData(
                          showTitle: false,
                          badgePositionPercentageOffset: 1.2,
                          badgeWidget: Container(
                            width: 100,
                            height: 45,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Color(e['color'] as int).withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 15,
                                  offset: const Offset(-2, 3),
                                ),
                              ],
                            ),
                            child: BgBlur(
                                borderColor: Colors.transparent,
                                padding: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      e["icon"] as String,
                                      width: 30,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      e["symbol"] as String,
                                      textAlign: TextAlign.center,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                          ),
                          color: Color(e["color"] as int),
                          value: WalletUtils.calculatePercentageByAmount(
                              e["amount"] as double, e["symbol"] as String),
                          radius: 10,
                        ))
                  ],
                ),
                swapAnimationDuration:
                    const Duration(milliseconds: 200), // Optional
                swapAnimationCurve: Curves.linear, // Optional
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.25,
                top: MediaQuery.of(context).size.height * 0.11,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            walletProvider.toggleHidden();
                          },
                          child: walletProvider.isHidden
                              ? SvgPicture.asset("assets/icons/eye-slash.svg")
                              : SvgPicture.asset("assets/icons/eye.svg")),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Total amount",
                        style: TextStyle(color: CurrentTheme.textColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        walletProvider.isHidden
                            ? "***********"
                            : "\$ ${(WalletUtils.calculateWalletTotal() as double).toStringAsFixed(2)}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: CurrentTheme.textColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        walletProvider.isHidden
                            ? "≈ ********* BTC (* ** %)"
                            : "≈ ${(WalletUtils.calculateWalletTotalInBTC() as double).toStringAsFixed(8)} BTC (+ 32%)",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xff02FF63)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...walletData.map((e) => Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Color(e["color"] as int),
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${(WalletUtils.calculatePercentageByAmount(e['amount'] as double, e['symbol'] as String) as double).toStringAsFixed(2)} %",
                      style: TextStyle(color: CurrentTheme.textColor),
                    )
                  ],
                ))
          ],
        )
      ],
    );
  }
}
