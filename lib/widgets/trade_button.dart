import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';
import 'package:cripto_exchange_ui/providers/providers.dart';

class TradeButton extends StatelessWidget {
  const TradeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return GestureDetector(
      onTap: () {
        menuProvider.setSelectedItem("Trade");
      },
      child: Transform.rotate(
        angle: 3.14 / 4,
        child: Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              boxShadow: menuProvider.selectedItem == "Trade"
                  ? const [
                      BoxShadow(
                          color: Color.fromARGB(255, 2, 251, 255),
                          blurRadius: 40,
                          spreadRadius: 0)
                    ]
                  : const [],
              color: const Color(0xff2B2E35),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: const GradientBoxBorder(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(0, 250, 255, 1),
                      Color.fromRGBO(102, 11, 255, 1),
                    ]),
                width: 1,
              )),
          child: Transform.rotate(
              angle: -3.14 / 4,
              child: SvgPicture.asset("assets/icons/trade.svg")),
        ),
      ),
    );
  }
}
