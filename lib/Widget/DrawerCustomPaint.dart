import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerCustomPaint extends StatefulWidget {
  @override
  _DrawerCustomPaintState createState() => _DrawerCustomPaintState();
}

class _DrawerCustomPaintState extends State<DrawerCustomPaint> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(1.sw,
          0.25.sh), //You can Replace this with your desired WIDTH and HEIGHT
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_0.shader = ui.Gradient.linear(
        Offset(size.width, size.height * 0.68),
        Offset(size.width, size.height * 0.68),
        [Color(0xff023b93),Color(0xff1ca3fd)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.quadraticBezierTo(
        size.width, size.height * 0.75, size.width, size.height);
    path_0.quadraticBezierTo(
        size.width * 0.99, size.height * 1.95, 0, size.height * 0.33);

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
