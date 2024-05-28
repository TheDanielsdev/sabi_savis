import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabi_savis/src/config/colors.dart';

class PinCodeButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  const PinCodeButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralButton(
      height: 20,
      width: 20,
      borderRadius: 50,
      onPressed: onPressed,
      buttonColor: kTransparent,
      borderColor: kTransparent,
      elevation: MaterialStateProperty.all(0),
      overlayColor: getColor(kWhite, kPrimary.withOpacity(0.2)),
      child: child ??
          Text(
            text ?? '',
            style: const TextStyle(
                fontSize: 22, color: kGrey7, fontWeight: FontWeight.w600),
          ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    }

    return MaterialStateProperty.resolveWith((getColor));
  }
}

class GeneralButton extends ConsumerWidget {
  const GeneralButton({
    Key? key,
    this.title,
    this.titleColor,
    this.buttonColor,
    this.height,
    this.width,
    this.borderColor,
    required this.onPressed,
    this.iconVisibility,
    this.titleStyle,
    this.borderRadius,
    this.style,
    this.icon,
    this.child,
    this.elevation,
    this.overlayColor,
  }) : super(key: key);

  final String? title;
  final IconData? icon;
  final Color? titleColor;
  final TextStyle? titleStyle;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Function()? onPressed;
  final bool? iconVisibility;
  final double? borderRadius;
  final Widget? child;
  final ButtonStyle? style;
  final MaterialStateProperty<double?>? elevation;
  final MaterialStateProperty<Color?>? overlayColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width ?? double.maxFinite,
      height: height ?? 40,
      child: ElevatedButton(
        style: style ??
            ButtonStyle(
              elevation: elevation ?? MaterialStateProperty.all(0.5),
              overlayColor: overlayColor,
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
                      side: BorderSide(color: borderColor ?? kPrimary))),
              backgroundColor:
                  MaterialStateProperty.all<Color>(buttonColor ?? kPrimary),
            ),
        onPressed: onPressed,
        child: child ??
            Text(
              title ?? 'Continue',
            ),
      ),
    );
  }
}
