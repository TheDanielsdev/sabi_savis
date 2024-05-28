import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabi_savis/src/config/colors.dart';
import 'package:sabi_savis/src/constants/globals/global_btn.dart';
import 'package:sabi_savis/src/constants/globals/global_txt_field.dart';
import 'package:sabi_savis/src/constants/globals/nav_bar.dart';
import 'package:sabi_savis/src/features/auth/presentation/signup.dart';
import 'package:sabi_savis/src/features/auth/presentation/widgets/line.dart';
import 'package:sabi_savis/src/features/home_and_actions/presentation/home.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  TextEditingController controller = TextEditingController();
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
            const Text(
              'Create your Account',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: kBlack,
              ),
            ),
            GeneralTextField(
              controller: controller,
              onTap: () {},
              hintText: 'email',
              iconName: Icons.mail,
            ),
            const SizedBox(
              height: 10,
            ),
            GeneralTextField(
              controller: controller,
              onTap: () {},
              hintText: 'email',
              iconName: Icons.mail,
            ),
            const SizedBox(
              height: 20,
            ),
            GlobalBtn(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const NavBar()));
              },
              height: 50,
              width: double.infinity,
              btColor: kPrimary,
              child: const Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white, // Optional: Text color
                ),
              ),
            ),
            const SizedBox(
              height: 50,
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
                  'Or continue with',
                  style: TextStyle(color: kBlack, fontSize: 15),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GlobalBtn(
                    height: 50,
                    radius: 10,
                    width: 80,
                    btColor: kWhite,
                    child: Image.asset('lib/assets/imgs/Vector (7).png')),
                GlobalBtn(
                    height: 50,
                    radius: 10,
                    width: 80,
                    btColor: kWhite,
                    child: Image.asset(
                      'lib/assets/imgs/Vector (7).png',
                      width: 20,
                    )),
                GlobalBtn(
                    height: 50,
                    radius: 10,
                    width: 80,
                    btColor: kWhite,
                    child: Image.asset('lib/assets/imgs/Vector (7).png')),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dont have an account ? ',
                  style: TextStyle(
                    color: kGrey5,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SignUp()));
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: kPrimary, // Optional: Text color
                    ),
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
