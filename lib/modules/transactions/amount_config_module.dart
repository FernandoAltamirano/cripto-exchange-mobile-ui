import 'package:cripto_exchange_ui/providers/providers.dart';
import 'package:cripto_exchange_ui/theme/current_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AmountConfigModule extends StatelessWidget {
  const AmountConfigModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              configProvider.cardDetailsisHidden
                  ? "\$ *******"
                  : "\$ 98,295.45",
              style: const TextStyle(
                  color: CurrentTheme.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              configProvider.cardDetailsisHidden
                  ? "\$ ******* BTC"
                  : "≈ 0.98 BTC",
              style: const TextStyle(
                color: CurrentTheme.textColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  configProvider.toggleCardDetailsIsHidden();
                },
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.fromBorderSide(BorderSide(
                          color: Color.fromRGBO(47, 47, 56, 1), width: 1))),
                  child: SvgPicture.asset("assets/icons/eye.svg"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.fromBorderSide(BorderSide(
                        color: Color.fromRGBO(47, 47, 56, 1), width: 1))),
                child: SvgPicture.asset("assets/icons/settings.svg"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
