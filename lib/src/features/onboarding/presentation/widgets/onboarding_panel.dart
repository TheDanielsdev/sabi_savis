import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabi_savis/src/config/colors.dart';

class OnboardingPanel extends ConsumerWidget {
  String img;
  String data;
  OnboardingPanel({
    super.key,
    required this.img,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Image.asset(
          img,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          data,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: kBlack,
          ),
        )
      ],
    );
  }
}
