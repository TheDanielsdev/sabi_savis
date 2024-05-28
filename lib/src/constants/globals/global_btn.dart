import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalBtn extends ConsumerWidget {
  Color btColor;
  void Function()? onPressed;
  Widget child;
  double? width;
  double? height;
  double? radius;
  GlobalBtn(
      {super.key,
      required this.btColor,
      this.onPressed,
      required this.child,
      this.width,
      this.height,
      this.radius});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => onPressed!(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 50.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(btColor),
        ),
        child: child,
      ),
    );
  }
}
