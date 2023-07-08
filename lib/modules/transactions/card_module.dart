import 'package:cripto_exchange_ui/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:cripto_exchange_ui/theme/current_theme.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CardModule extends StatelessWidget {
  const CardModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardDetailsisHidden =
        Provider.of<ConfigProvider>(context).cardDetailsisHidden;

    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: 100,
            height: 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(102, 11, 255, 1),
                    Color.fromRGBO(0, 250, 255, 1),
                  ],
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.55,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 63, 64, 93),
              border: Border.all(color: const Color.fromARGB(48, 0, 0, 0)),
              borderRadius: const BorderRadius.all(Radius.circular(22)),
            ),
            child: Stack(
              children: [
                const Image(
                  image: AssetImage("assets/images/card-mask.png"),
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color.fromARGB(181, 15, 20, 35),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bitcox",
                              style: TextStyle(
                                  color: CurrentTheme.textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: GradientRing(
                                center: Offset(0, 2),
                                radius: 5,
                                strokeWidth: 2,
                                width: 0,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 0, left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Expira",
                                  style: TextStyle(
                                      color: CurrentTheme.textColor,
                                      fontSize: 12),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  "12/25",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: CurrentTheme.textColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 15),
                                const Text(
                                  "CVV",
                                  style: TextStyle(
                                      color: CurrentTheme.textColor,
                                      fontSize: 12),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  cardDetailsisHidden ? "***" : "321",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: CurrentTheme.textColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  cardDetailsisHidden ? "****" : "3141",
                                  style: const TextStyle(
                                      fontSize: 24,
                                      color: CurrentTheme.textColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  cardDetailsisHidden ? "****" : "5946",
                                  style: const TextStyle(
                                      fontSize: 24,
                                      color: CurrentTheme.textColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  cardDetailsisHidden ? "****" : "5477",
                                  style: const TextStyle(
                                      fontSize: 24,
                                      color: CurrentTheme.textColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  cardDetailsisHidden ? "****" : "9793",
                                  style: const TextStyle(
                                      fontSize: 24,
                                      color: CurrentTheme.textColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 120,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(22),
                                bottomRight: Radius.circular(22)),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(0, 250, 255, 0.4),
                                Color.fromRGBO(102, 11, 255, 0.4),
                              ], // Colores del degradado
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 40,
                                bottom: 20,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(221, 255, 255, 255),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(1000))),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 20,
                                child: Container(
                                  padding: const EdgeInsets.only(right: 15),
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(221, 255, 255, 255),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(1000))),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
