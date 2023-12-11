import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
      elevation: 0,
      shape: const MyShapeBorder(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double radius = 14.0;
    Path path = Path();
    path.lineTo(rect.left, rect.bottom);
    path.quadraticBezierTo(
      rect.width / 2,
      rect.bottom + 2 * radius,
      rect.width,
      rect.bottom,
    );
    path.lineTo(rect.right, rect.top);
    path.close();
    return path;
  }
}
