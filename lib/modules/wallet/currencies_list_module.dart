import 'package:flutter/material.dart';
import 'package:cripto_exchange_ui/mocks/wallet_data.dart';
import 'package:cripto_exchange_ui/theme/current_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrenciesListModule extends StatelessWidget {
  const CurrenciesListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Wallet",
            style: TextStyle(
                color: CurrentTheme.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 18),
          ),
          Container(
            padding: const EdgeInsets.all(7),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.fromBorderSide(BorderSide(
                    color: Color.fromRGBO(47, 47, 56, 1), width: 1))),
            child: SvgPicture.asset("assets/icons/search.svg"),
          )
        ],
      ),
      Column(
        children: [
          ...walletData.map((e) => Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(47, 47, 56, 1), width: 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 25, 27, 33),
                                borderRadius: BorderRadius.circular(10)),
                            child: SvgPicture.asset(e["icon"] as String)),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e["symbol"] as String,
                                style: const TextStyle(
                                    color: CurrentTheme.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                            Text(e["symbol"] as String,
                                style: TextStyle(
                                    color:
                                        CurrentTheme.textColor.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(e["amount"].toString(),
                            style: const TextStyle(
                                color: CurrentTheme.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text("\$ 1000.464",
                                style: TextStyle(
                                    color:
                                        CurrentTheme.textColor.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12)),
                            const SizedBox(width: 10),
                            const Text("+ 32%",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff02FF63))),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      )
    ]);
  }
}
