import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabi_savis/src/config/colors.dart';
import 'package:sabi_savis/src/constants/globals/global_btn.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:sabi_savis/src/features/auth/presentation/login.dart';
import 'package:sabi_savis/src/features/onboarding/data/panel_data.dart';
import 'package:sabi_savis/src/features/onboarding/presentation/widgets/onboarding_panel.dart';

class Onboarding extends ConsumerStatefulWidget {
  const Onboarding({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardingState();
}

class _OnboardingState extends ConsumerState<Onboarding> {
  PageController controller = PageController();
  final currentPageProvider = StateProvider<int>((ref) => 0);
  final isLstPageProvider = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(currentPageProvider);
    final isLstPage = ref.watch(isLstPageProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: PageView.builder(
              itemCount: panelData.length,
              onPageChanged: (value) {
                ref.read(currentPageProvider.notifier).state = value;
                ref.read(isLstPageProvider.notifier).state = value == 2;
              },
              controller: controller,
              itemBuilder: (_, i) {
                return OnboardingPanel(
                    img: panelData.elementAt(i)['img'].toString(),
                    data: panelData.elementAt(i)['txt'].toString());
              },
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          DotsIndicator(
            dotsCount: panelData.length,
            position: currentPage,
            decorator: DotsDecorator(
              color: Colors.black87, // Inactive color
              activeColor: kPrimary,
              size: const Size.square(9.0),
              activeSize: const Size(25.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          GlobalBtn(
            onPressed: () {
              switch (currentPage) {
                case 0:
                  controller.animateToPage(1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn);
                  break;
                case 1:
                  controller.animateToPage(2,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn);
                  break;
                default:
                  break;
              }
              if (isLstPage) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const Login()));
              }
            },
            btColor: kPrimary,
            height: 50,
            width: double.infinity,
            child: Text(
              isLstPage ? 'Get started' : 'Next',
              style: const TextStyle(
                color: Colors.white, // Optional: Text color
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class MyNotifier extends StateNotifier<List<MList>> {
  MyNotifier() : super([]);

  void addToList(MList vl) {
    state.add(vl);
  }
}

class MList {}
