import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabi_savis/src/config/colors.dart';
import 'package:sabi_savis/src/features/home_and_actions/data/data.dart';
import 'package:sabi_savis/src/features/home_and_actions/presentation/widgets/special_offer_pane.dart';

class SpecialOffer extends ConsumerStatefulWidget {
  const SpecialOffer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends ConsumerState<SpecialOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: kBlack,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Special Offers',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: kBlack,
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded))
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: cardData.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SpecialOfferPane(
                        img: cardData.elementAt(i)['img'].toString(),
                        txt1: cardData.elementAt(i)['txt1'].toString(),
                        txt3: cardData.elementAt(i)['txt3'].toString(),
                        txt2: cardData.elementAt(i)['txt2'].toString(),
                        color: Color(int.parse(
                            cardData.elementAt(i)['color'].toString())),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
