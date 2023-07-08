import 'package:flutter/material.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBarModule extends StatelessWidget {
  const HomeAppBarModule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        child: TextField(
      onChanged: (value) => {print(value)},
      //change color text
      style: const TextStyle(color: Color.fromRGBO(98, 111, 119, 1)),
      decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              "assets/icons/search.svg",
            ),
          )),
    ));
  }
}
