import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabi_savis/src/config/colors.dart';
import 'package:sabi_savis/src/constants/globals/global_txt_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sabi_savis/src/features/home_and_actions/data/data.dart';
import 'package:sabi_savis/src/features/home_and_actions/presentation/special_offers.dart';
import 'package:sabi_savis/src/features/home_and_actions/presentation/widgets/half_btn.dart';
import 'package:sabi_savis/src/features/home_and_actions/presentation/widgets/services_pane.dart';
import 'package:sabi_savis/src/features/home_and_actions/presentation/widgets/special_offer_pane.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  TextEditingController controller = TextEditingController();
  int _currentIndex = 0;
  Color? _randomColor;
  int screenTracker = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(children: [
                Image.asset('lib/assets/imgs/david_collen.png'),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  children: [
                    Text(
                      'Good Morning ',
                      style: TextStyle(
                          color: kGrey3,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Ashley Brown',
                      style: TextStyle(
                          color: kBlack,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_outlined,
                        color: kBlack)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_outline,
                      color: kBlack,
                    ))
              ]),
              const SizedBox(
                height: 20,
              ),
              GeneralTextField(
                filledColor: kGrey3,
                controller: controller,
                onTap: () {},
                hintText: 'Search',
                iconName: CupertinoIcons.search,
                suffixIcon: const Icon(Icons.equalizer_outlined),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'Special Offers',
                    style: TextStyle(
                        color: kBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: kPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider.builder(
                    itemCount: cardData.length,
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      autoPlay: true,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SpecialOffer()));
                          },
                          child: SpecialOfferPane(
                            img: cardData.elementAt(index)['img'].toString(),
                            txt1: cardData.elementAt(index)['txt1'].toString(),
                            txt3: cardData.elementAt(index)['txt3'].toString(),
                            txt2: cardData.elementAt(index)['txt2'].toString(),
                            color: Color(int.parse(
                                cardData.elementAt(index)['color'].toString())),
                          ),
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: cardData.map((url) {
                      int index = cardData.toList().indexOf(url);
                      return Container(
                        width: _currentIndex == index ? 15.0 : 5.0,
                        height: 5.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'Services',
                    style: TextStyle(
                        color: kBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: kPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 40,
                runSpacing: 30,
                alignment: WrapAlignment.start,
                children: serviceData.toList().map((tag) {
                  return HomeServicesPane(
                    img: tag['img'].toString(),
                    vl: tag['vl'].toString(),
                    color: getRandomColor(),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: kGrey3,
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'Most popular',
                    style: TextStyle(
                        color: kBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: kPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: HalfButton(
                          onPressed: () {
                            setState(() {
                              screenTracker = 0;
                            });
                            if (kDebugMode) {
                              print(screenTracker);
                            }
                          },
                          titl: 'All',
                          color: screenTracker == 0 ? kPrimary : kWhite,
                          txtColor: screenTracker == 0 ? kWhite : kPrimary,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: HalfButton(
                          onPressed: () {
                            setState(() {
                              screenTracker = 1;
                            });
                            if (kDebugMode) {
                              print(screenTracker);
                            }
                          },
                          titl: 'Cleaning',
                          color: screenTracker == 1 ? kPrimary : kWhite,
                          txtColor:
                              screenTracker == 1 ? Colors.white : kPrimary,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: HalfButton(
                          onPressed: () {
                            setState(() {
                              screenTracker = 2;
                            });
                            if (kDebugMode) {
                              print(screenTracker);
                            }
                          },
                          titl: 'Repearing',
                          color: screenTracker == 2 ? kPrimary : kWhite,
                          txtColor:
                              screenTracker == 2 ? Colors.white : kPrimary,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: HalfButton(
                          onPressed: () {
                            setState(() {
                              screenTracker = 3;
                            });
                            if (kDebugMode) {
                              print(screenTracker);
                            }
                          },
                          titl: 'Painting',
                          color: screenTracker == 3 ? kPrimary : kWhite,
                          txtColor:
                              screenTracker == 3 ? Colors.white : kPrimary,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: HalfButton(
                          onPressed: () {
                            setState(() {
                              screenTracker = 4;
                            });
                            if (kDebugMode) {
                              print(screenTracker);
                            }
                          },
                          titl: 'Laundry',
                          color: screenTracker == 4 ? kPrimary : kWhite,
                          txtColor:
                              screenTracker == 4 ? Colors.white : kPrimary,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: HalfButton(
                          onPressed: () {
                            setState(() {
                              screenTracker = 5;
                            });
                            if (kDebugMode) {
                              print(screenTracker);
                            }
                          },
                          titl: 'Appliance',
                          color: screenTracker == 5 ? kPrimary : kWhite,
                          txtColor:
                              screenTracker == 5 ? Colors.white : kPrimary,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getRandomColor() {
    if (_randomColor == null) {
      Random random = Random();
      _randomColor = Color.fromRGBO(
        random.nextInt(256), // Red (0-255)
        random.nextInt(256), // Green (0-255)
        random.nextInt(256), // Blue (0-255)
        1.0, // Alpha (opacity) - 1.0 for fully opaque
      );
    }
    return _randomColor!;
  }
}
