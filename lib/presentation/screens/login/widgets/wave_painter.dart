import 'package:flutter/cupertino.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF0172FC);
    final heightThreshold = size.height * 0.1; // Bắt đầu vẽ từ 60% chiều cao

    // Path 1 (opacity 0.25) - Chiếm toàn bộ phần dưới
    final path1 = Path()
      ..moveTo(0, heightThreshold)
      ..cubicTo(
        size.width, heightThreshold + size.height * 0.001,
        size.width, heightThreshold + size.height * 0.01,
          size.width, size.height
      )
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path1, paint..color = paint.color.withOpacity(0.25));

    // Path 2 (opacity 0.5) - Wave chính
    final path2 = Path()
      ..moveTo(0, heightThreshold + size.height * 0.05)
      ..cubicTo(
        size.width, heightThreshold + size.height * 0.05,
        size.width, heightThreshold + size.height * 0.15,
          size.width, size.height
      )
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path2, paint..color = paint.color.withOpacity(0.5));

    // Path 3 (opacity 1.0) - Đường nổi bật trên cùng
    final path3 = Path()
      ..moveTo(0, heightThreshold + size.height * 0.1)
      ..quadraticBezierTo(
        size.width, heightThreshold + size.height * 0.15,
        size.width, heightThreshold + size.height * 0.5,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}