import 'package:flutter/material.dart';

class RoundedArrowDownTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  const RoundedArrowDownTooltip(
      {Key? key, required this.child, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,

      preferBelow: false,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      padding: EdgeInsets.zero,
      verticalOffset: 20,
      textStyle: TextStyle(fontSize: 16),
      showDuration: Duration(seconds: 3),
      height: 50, // Adjust the height of the tooltip as needed
      waitDuration: Duration(milliseconds: 500),
      child: Stack(
        children: [
          child,
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 150, // Adjust the width of the tooltip as needed
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black
                    .withOpacity(0.8), // Background color of the tooltip
                borderRadius:
                    BorderRadius.circular(8), // Border radius of the tooltip
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  CustomPaint(
                    size: Size(30, 10),
                    painter: ArrowPainter(), // CustomPainter to draw the arrow
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.8) // Color of the arrow
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
