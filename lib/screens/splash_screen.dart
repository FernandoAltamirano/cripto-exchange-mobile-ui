import 'package:cripto_exchange_ui/theme/current_theme.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CurrentTheme.primaryColor,
        body: const Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bitcox",
              style: TextStyle(
                  color: CurrentTheme.textColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 15),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: GradientRing(
                center: Offset(0, 2),
                radius: 8,
                strokeWidth: 4,
                width: 0,
                height: 0,
              ),
            )
          ],
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SwipeButton(
          width: MediaQuery.of(context).size.width * 0.8,
          backgroundColor: CurrentTheme.secondaryColor,
          child: const Text('Swipe to get started',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        ));
  }
}
