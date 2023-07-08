import 'package:flutter/material.dart';

class GradientRing extends StatelessWidget {
  const GradientRing(
      {Key? key,
      required this.center,
      required this.radius,
      this.width,
      this.height,
      required this.strokeWidth})
      : super(key: key);
  final Offset center;
  final double radius;
  final double strokeWidth;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 200,
      child: CustomPaint(
        painter: GradientRingPainter(
            center: center, radius: radius, strokeWidth: strokeWidth),
      ),
    );
  }
}

class GradientRingPainter extends CustomPainter {
  final Offset center;
  final double radius;
  final double strokeWidth;

  GradientRingPainter(
      {required this.center, required this.radius, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    const gradient = LinearGradient(
      colors: [
        Color.fromRGBO(0, 250, 255, 1),
        Color.fromRGBO(102, 11, 255, 1),
      ], // Colores del degradado
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final paint = Paint()
      ..shader =
          gradient.createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
