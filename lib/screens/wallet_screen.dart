import 'package:cripto_exchange_ui/theme/current_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cripto_exchange_ui/modules/modules.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            Expanded(child: Container()),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/arrow-left.svg"),
                  const SizedBox(width: 5),
                  const Text(
                    "Crypto",
                    style:
                        TextStyle(color: CurrentTheme.textColor, fontSize: 18),
                  ),
                  const SizedBox(width: 5),
                  Transform.rotate(
                      angle: 3.14,
                      child: SvgPicture.asset("assets/icons/arrow-left.svg")),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset("assets/icons/linear-graph.svg"),
                  const SizedBox(width: 10),
                  SvgPicture.asset("assets/icons/text.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
      const PieChartModule(),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: CurrenciesListModule(),
      )
    ]);
  }
}
