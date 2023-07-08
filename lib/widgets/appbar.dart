import 'package:flutter/material.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.child,
    this.bgColor = const Color.fromARGB(255, 11, 12, 20),
  });
  final Widget child;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 15, 20, 35),
      title: Container(
        height: 40,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.only(right: 15),
        child: child,
      ),
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.fromBorderSide(
                  BorderSide(color: Color.fromRGBO(47, 47, 56, 1), width: 1))),
          child: const User(),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(7),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.fromBorderSide(BorderSide(
                    color: Color.fromRGBO(47, 47, 56, 1), width: 1))),
            child: SvgPicture.asset("assets/icons/notification.svg"),
          ),
        ),
      ],
      elevation: 0,
    );
  }
}
