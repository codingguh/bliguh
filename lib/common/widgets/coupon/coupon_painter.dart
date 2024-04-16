import 'package:flutter/material.dart';

class CouponPainter extends CustomPainter {
  // final Color borderColor;
  final Color bgColor;
  final Color borderColor;

  static const _cornerGap = 5.0;
  static const _cutoutRadius = 0.5;
  static const _cutoutDiameter = 12;

  CouponPainter({
    required this.bgColor,
    this.borderColor = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final maxWidth = size.width;
    final maxHeight = size.height;

    final cutoutStartPos = maxHeight - maxHeight * 0.05;
    final cutoutStartPos1 = maxHeight - maxHeight * 0.23;
    final cutoutStartPos2 = maxHeight - maxHeight * 0.43;
    final cutoutStartPos3 = maxHeight - maxHeight * 0.63;
    final cutoutStartPos4 = maxHeight - maxHeight * 0.82;

    final leftCutoutStartY = cutoutStartPos;
    final leftCutoutStartY1 = cutoutStartPos1;
    final leftCutoutStartY2 = cutoutStartPos2;
    final leftCutoutStartY3 = cutoutStartPos3;
    final leftCutoutStartY4 = cutoutStartPos4;

    final paintBg = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = bgColor;

    final paintBorder = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = borderColor;

    var path = Path();

    path.moveTo(_cornerGap, 0);
    path.lineTo(maxWidth - _cornerGap, 0);
    _drawCornerArc(path, maxWidth, _cornerGap);
    // path.lineTo(maxWidth, rightCutoutStartY);
    // _drawCutout(path, maxWidth, rightCutoutStartY + _cutoutDiameter);
    path.lineTo(maxWidth, maxHeight - _cornerGap);
    _drawCornerArc(path, maxWidth - _cornerGap, maxHeight);
    path.lineTo(_cornerGap, maxHeight);
    _drawCornerArc(path, 0, maxHeight - _cornerGap);
    path.lineTo(0, leftCutoutStartY);
    _drawCutout(path, 0.0, leftCutoutStartY - _cutoutDiameter);

    path.lineTo(0, leftCutoutStartY1);
    _drawCutout(path, 0.0, leftCutoutStartY1 - _cutoutDiameter);

    path.lineTo(0, leftCutoutStartY2);
    _drawCutout(path, 0.0, leftCutoutStartY2 - _cutoutDiameter);

    path.lineTo(0, leftCutoutStartY3);
    _drawCutout(path, 0.0, leftCutoutStartY3 - _cutoutDiameter);

    path.lineTo(0, leftCutoutStartY4);
    _drawCutout(path, 0.0, leftCutoutStartY4 - _cutoutDiameter);

    path.lineTo(0, _cornerGap);
    _drawCornerArc(path, _cornerGap, 0);

    canvas.drawPath(path, paintBg);
    // canvas.drawPath(path, paintBorder);
    // Draw border only on top, bottom, and right sides
    canvas.drawLine(Offset(_cornerGap, 0), Offset(maxWidth - _cornerGap, 0),
        paintBorder); // top
    canvas.drawLine(Offset(maxWidth, _cornerGap),
        Offset(maxWidth, maxHeight - _cornerGap), paintBorder); // right
    canvas.drawLine(Offset(_cornerGap, maxHeight),
        Offset(maxWidth - _cornerGap, maxHeight), paintBorder); // bottom
  }

  _drawCutout(Path path, double startX, double endY) {
    path.arcToPoint(
      Offset(startX, endY),
      radius: const Radius.circular(_cutoutRadius),
      clockwise: false,
    );
  }

  _drawCornerArc(Path path, double endPointX, double endPointY) {
    path.arcToPoint(
      Offset(endPointX, endPointY),
      radius: const Radius.circular(_cornerGap),
    );
  }

  @override
  bool shouldRepaint(CouponPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CouponPainter oldDelegate) => false;
}

class LeftCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height - 30); // Adjust as needed to fit the curve
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
