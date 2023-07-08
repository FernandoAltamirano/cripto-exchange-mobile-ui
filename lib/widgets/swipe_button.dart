import 'package:action_slider/action_slider.dart';
import 'package:cripto_exchange_ui/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SwipeButton extends StatelessWidget {
  const SwipeButton({
    Key? key,
    required this.width,
    required this.backgroundColor,
    required this.child,
  }) : super(key: key);
  final double width;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ActionSlider.standard(
        width: width,
        backgroundColor: backgroundColor,
        reverseSlideAnimationCurve: Curves.easeInOut,
        reverseSlideAnimationDuration: const Duration(milliseconds: 200),
        toggleColor: Colors.white,
        icon: SvgPicture.asset(
          "assets/icons/next.svg",
          width: 20,
        ),
        action: (controller) async {
          controller.loading(); //starts loading animation
          await Future.delayed(const Duration(seconds: 1));
          controller.success(); //starts success animation
          await Future.delayed(const Duration(milliseconds: 500));
          Provider.of<MenuProvider>(context, listen: false)
              .setSelectedItem("Home");
        },
        child: child);
  }
}
