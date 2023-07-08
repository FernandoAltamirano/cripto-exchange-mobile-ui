import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 6,
      child: CustomPaint(
        painter: HexagonalPainter(
          color: Colors.white,
          strokeWidth: 1,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Transform.rotate(
              angle: -pi / 6, child: SvgPicture.asset("assets/icons/user.svg")),
        ),
      ),
    );
  }
}

class HexagonalPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  HexagonalPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final sideLength = size.width / 2;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final radius = sideLength /
        (0.866); // Aproximadamente 0.866 es la relación del radio al lado de un hexágono regular

    for (var i = 0; i < 6; i++) {
      final angle = 2 * pi / 6 * i;
      final x = centerX + radius * cos(angle);
      final y = centerY + radius * sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HexagonalPainter oldDelegate) => false;
}
