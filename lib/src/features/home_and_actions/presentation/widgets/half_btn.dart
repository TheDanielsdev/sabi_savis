import 'package:flutter/material.dart';
import 'package:sabi_savis/src/config/colors.dart';

class HalfButton extends StatelessWidget {
  String? titl;
  Color? color;
  Color? txtColor;
  final Function()? onPressed;
  HalfButton({super.key, this.titl, this.color, this.txtColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints:
            const BoxConstraints(minWidth: 55, maxWidth: double.infinity),
        height: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color ?? kPrimary,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: kPrimary)),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Center(
            child: Text(
              titl ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: txtColor ?? Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
