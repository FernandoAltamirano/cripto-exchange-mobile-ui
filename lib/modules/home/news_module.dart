import 'package:cripto_exchange_ui/theme/current_theme.dart';
import 'package:flutter/material.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsModule extends StatefulWidget {
  NewsModule({Key? key}) : super(key: key);

  @override
  State<NewsModule> createState() => _NewsModuleState();
}

class _NewsModuleState extends State<NewsModule> {
  late CarouselController carouselController;

  @override
  void initState() {
    super.initState();
    carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(children: [
      GradientRing(
          center: Offset(size.width / 1.1, size.height / 14),
          radius: size.width / 8,
          strokeWidth: 35),
      GradientRing(
          center: Offset(-size.width / 20, size.height / 9),
          radius: size.width / 12,
          strokeWidth: 20),
      CarouselSlider(
        options: CarouselOptions(
          height: 200,
          viewportFraction: 1,
          enableInfiniteScroll: true,
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return NewsItem();
            },
          );
        }).toList(),
      ),
    ]);
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BgBlur(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bitcox",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 250, 255, 1),
                    borderRadius: BorderRadius.circular(12)),
                child: const Text("Buy"),
              ),
              const SizedBox(height: 10),
              const Text("BTC, ETH, AVAX and\n other cryptos",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
              const SizedBox(height: 10),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enjoy",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "HIGHER DEPOSITS\n & WITHDRAWALS",
                    style: TextStyle(
                        height: 1.3, color: Color.fromRGBO(0, 250, 255, 1)),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(width: 30),
          SvgPicture.asset(
            "assets/images/news1.svg",
            width: MediaQuery.of(context).size.width * 0.25,
          )
        ],
      ),
    );
  }
}
