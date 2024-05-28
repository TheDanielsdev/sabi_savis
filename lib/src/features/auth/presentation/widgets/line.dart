import 'package:flutter/material.dart';

class Thin1mmLine extends StatelessWidget {
  final Color color;
  const Thin1mmLine({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: color,
    );
  }
}
