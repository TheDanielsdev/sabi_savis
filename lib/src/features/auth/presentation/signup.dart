import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabi_savis/src/config/colors.dart';
import 'package:sabi_savis/src/constants/globals/global_btn.dart';
import 'package:sabi_savis/src/features/auth/presentation/create_pin.dart';
import 'package:sabi_savis/src/features/auth/presentation/widgets/line.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'lib/assets/imgs/work-4997565_1280.png',
              width: 300,
              fit: BoxFit.cover,
            ),
            const Text(
              'Lets you in',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: kBlack,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GlobalBtn(
              height: 50,
              btColor: kWhite,
              radius: 10.0,
              child: Row(
                children: [
                  Image.asset('lib/assets/imgs/Vector (7).png'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Sign up with Facebook',
                    style: TextStyle(
                      color: kBlack, // Optional: Text color
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GlobalBtn(
              height: 50,
              btColor: kWhite,
              radius: 10.0,
              child: Row(
                children: [
                  Image.asset('lib/assets/imgs/Vector (7).png'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Sign up with Facebook',
                    style: TextStyle(
                      color: kBlack, // Optional: Text color
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GlobalBtn(
              height: 50,
              btColor: kWhite,
              radius: 10.0,
              child: Row(
                children: [
                  Image.asset('lib/assets/imgs/Vector (7).png'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Sign up with Facebook',
                    style: TextStyle(
                      color: kBlack, // Optional: Text color
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Thin1mmLine(
                    color: kGrey5,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Or',
                  style: TextStyle(color: kBlack, fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Thin1mmLine(
                    color: kGrey5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GlobalBtn(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CreatePin()));
              },
              height: 50,
              width: double.infinity,
              btColor: kPrimary,
              child: const Text(
                'Sign in with password',
                style: TextStyle(
                  color: Colors.white, // Optional: Text color
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account ? ',
                  style: TextStyle(
                    color: kGrey5,
                  ),
                ),
                Text(
                  'Sign up',
                  style: TextStyle(
                    color: kPrimary, // Optional: Text color
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
