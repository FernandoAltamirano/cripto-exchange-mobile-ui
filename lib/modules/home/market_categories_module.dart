import 'package:flutter/material.dart';
import 'package:cripto_exchange_ui/theme/current_theme.dart';
import 'package:provider/provider.dart';
import 'package:cripto_exchange_ui/providers/providers.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';

const marketData = [
  {
    "symbol": "BTC",
    "categories": ["Favorites", "Hot", "Winners"],
    "price": "47,885.94",
    "change": "1.18B",
    "status": 1
  },
  {
    "symbol": "ETH",
    "categories": ["Favorites", "Hot"],
    "price": "1,885.94",
    "change": "1.18B",
    "status": -1
  },
  {
    "symbol": "XRP",
    "categories": ["Favorites", "New listings"],
    "price": "0,479",
    "change": "3.567M",
    "status": 0
  },
  {
    "symbol": "ADA",
    "categories": ["Favorites", "Hot"],
    "price": "0,45",
    "change": "45.6M",
    "status": 0
  },
  {
    "symbol": "DOGE",
    "categories": ["Favorites", "Hot", "Winners"],
    "price": "0,009423",
    "change": "999.2B",
    "status": 1
  },
  {
    "symbol": "DOT",
    "categories": ["hot", "Winners"],
    "price": "0,544",
    "change": "2323.34M",
    "status": 1
  },
  {
    "symbol": "UNI",
    "categories": ["Favorites", "Winners", "New listings"],
    "price": "0,885.94",
    "change": "11.18M",
    "status": 0
  },
  {
    "symbol": "LTC",
    "categories": ["Favorites", "New listings"],
    "price": "104,78",
    "change": "21.18B",
    "status": 0
  },
  {
    "symbol": "LINK",
    "categories": ["Favorites", "New listings"],
    "price": "0,885.94",
    "change": "11.18B",
    "status": -1
  },
  {
    "symbol": "PEPE",
    "categories": ["Favorites", "New listings", "Memes"],
    "price": "0,0000932",
    "change": "117503.34B",
    "status": -1
  }
];

class MarketCategoriesModule extends StatefulWidget {
  const MarketCategoriesModule({Key? key}) : super(key: key);

  @override
  State<MarketCategoriesModule> createState() => _MarketCategoriesModuleState();
}

class _MarketCategoriesModuleState extends State<MarketCategoriesModule> {
  String selectedCategory = "Favorites";

  selectedColorByStatus(int status) {
    if (status > 0) {
      return const Color(0xff02FF63);
    } else if (status < 0) {
      return const Color(0xffFF467F);
    }
    return CurrentTheme.textColor;
  }

  final rowHeader = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Market",
        style: TextStyle(
          color: CurrentTheme.textColor.withOpacity(0.5),
          fontSize: 14,
        ),
      ),
      Text(
        "Price",
        style: TextStyle(
          color: CurrentTheme.textColor.withOpacity(0.5),
          fontSize: 14,
        ),
      ),
      Text(
        "Change",
        style: TextStyle(
          color: CurrentTheme.textColor.withOpacity(0.5),
          fontSize: 14,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);
    return Column(
      children: [
        HorizontalScrollItems(
            onTap: (e) {
              configProvider.setMarketCategoryActive(e);
            },
            selectedCategory: configProvider.marketCategoryActive,
            categories: const [
              "Favorites",
              "Hot",
              "Winners",
              "New listings",
              "Memes"
            ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              rowHeader,
              ...marketData
                  .where((element) => (element["categories"] as List)
                      .contains(configProvider.marketCategoryActive))
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    e["symbol"] as String,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "/ USDT",
                                    style: TextStyle(
                                      color: CurrentTheme.textColor,
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 30),
                                child: Text(
                                  e["price"] as String,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: selectedColorByStatus(
                                        e["status"] as int),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                e["change"] as String,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  color: CurrentTheme.textColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
            ],
          ),
        )
      ],
    );
  }
}
