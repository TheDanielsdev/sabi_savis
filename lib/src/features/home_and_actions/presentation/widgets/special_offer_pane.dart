import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabi_savis/src/config/colors.dart';

class SpecialOfferPane extends ConsumerWidget {
  final Color? color;
  final String img;
  final String txt1;
  final String txt3;
  final String txt2;
  const SpecialOfferPane(
      {super.key,
      this.color,
      required this.img,
      required this.txt1,
      required this.txt3,
      required this.txt2});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txt1,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: kWhite),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    txt2,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kWhite),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    txt3,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: kWhite),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 10,
            ),
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
