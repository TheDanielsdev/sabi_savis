import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeServicesPane extends ConsumerWidget {
  Color? color;
  String img;
  String vl;
  HomeServicesPane({
    super.key,
    this.color,
    required this.img,
    required this.vl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: color),
          child: Center(
            child: Image.asset(
              img,
              width: 25,
              height: 25,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          vl,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
