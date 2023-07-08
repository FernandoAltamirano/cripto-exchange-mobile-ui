import 'package:flutter/material.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';
import 'package:gradient_borders/gradient_borders.dart';

class HorizontalScrollItems extends StatelessWidget {
  const HorizontalScrollItems(
      {Key? key,
      required this.onTap,
      required this.selectedCategory,
      required this.categories})
      : super(key: key);
  final Function(String) onTap;
  final String selectedCategory;
  final List<String> categories;

  selectedColors(String color) {
    if (selectedCategory == color) {
      return [
        const Color.fromRGBO(0, 250, 255, 1),
        const Color.fromRGBO(102, 11, 255, 1),
      ];
    }
    return [
      const Color.fromRGBO(0, 0, 0, 0),
      const Color.fromRGBO(0, 0, 0, 0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BgBlur(
      padding: 6,
      borderColor: Colors.transparent,
      child: Container(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...categories.map((e) {
              return GestureDetector(
                onTap: () => onTap(e),
                child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: selectedColors(e)),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Text(
                      e,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    )),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
