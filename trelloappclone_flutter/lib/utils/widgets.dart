import 'package:flutter/material.dart';

class ColorSquare extends StatefulWidget {
  final String bg;

  const ColorSquare({required this.bg, super.key});

  @override
  State<ColorSquare> createState() => _ColorSquareState();
}

class _ColorSquareState extends State<ColorSquare> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: Color(
              int.parse(widget.bg.substring(1, 7), radix: 16) + 0xFF000000),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
    );
  }
}
