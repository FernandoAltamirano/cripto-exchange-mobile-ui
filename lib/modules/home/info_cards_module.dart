import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';

class InfoCardsModule extends StatelessWidget {
  const InfoCardsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InfoCardModule(
          title: "P2P Trading",
          description: "Bank transfer, digital wallet, transfer to card",
          image: "assets/images/p2p.png",
        ),
        InfoCardModule(
          title: "Credit / Debit Card",
          description: "Visa, Mastercard, American Express, Dinners Club",
          image: "assets/images/card.png",
        ),
      ],
    );
  }
}

class InfoCardModule extends StatelessWidget {
  const InfoCardModule({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return BgBlur(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Container(
        constraints: BoxConstraints.expand(height: 130),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(
              height: 0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage(image),
                    width: 70,
                  ),
                  SvgPicture.asset("assets/icons/circle-next.svg")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
