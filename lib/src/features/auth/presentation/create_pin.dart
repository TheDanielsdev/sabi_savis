import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabi_savis/src/config/colors.dart';
import 'package:sabi_savis/src/constants/globals/global_btn.dart';
import 'package:sabi_savis/src/features/auth/presentation/widgets/pin_btn.dart';
import 'package:sabi_savis/src/features/home_and_actions/presentation/home.dart';

class CreatePin extends ConsumerStatefulWidget {
  final String? servicePlan;
  final String? phoneNumber;
  const CreatePin({this.phoneNumber, this.servicePlan, super.key});

  @override
  ConsumerState<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends ConsumerState<CreatePin> {
  List<String> pinCode = [];

  void _addToPinCode(String value) async {
    if (pinCode.length < 4) {
      setState(() {
        pinCode.add(value);
      });
    }

    if (pinCode.length == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Home()));
    }

    // if (pinCode.length == 4) {
    //   isLoadingDialog(context);
    //   String pinCodeValue = pinCode.join('');
    //   await ref.watch(loadingVerifyTransactionPin.notifier).verifyTransaction(
    //         context: context,
    //         pin: pinCodeValue,
    //         onSuccess: () async {
    //           //Call necessary service Api here
    //           await ref.watch(loadingDataProvider.notifier).dataService(
    //               context: context,
    //               servicePlan: ref.watch(providerNetworkNumber),
    //               mobileNumber: widget.phoneNumber);
    //         },
    //       );
    // }
  }

  void _deleteFromPinCode() {
    if (pinCode.isNotEmpty) {
      setState(() {
        pinCode.removeLast();
      });
    }
  }

  // void onAuthenticationSuccess() {
  //   final transactionPin = ref.watch(authDataProvider).transactionPin;

  //   // Place your post-authentication logic here
  //   if (ref.read(transactionBiometricProvider.notifier).state == true) {
  //     VerifyTransactionService().verifyTransaction(
  //         context: context,
  //         pin: transactionPin ?? '',
  //         onSuccess: () async {
  //           await ref.watch(loadingDataProvider.notifier).dataService(
  //               context: context,
  //               servicePlan: ref.watch(providerNetworkNumber),
  //               mobileNumber: widget.phoneNumber);
  //           setState(() {
  //             pinCode.clear();
  //           });
  //         });
  //     print('Fingerprint authentication successful');
  //   } else {
  //     errorMessage(
  //         context: context,
  //         message: 'Please Enable Fingerprint ID for Transaction');
  //   }
  // }

  // void isLoadingDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     barrierColor: kAsh.withOpacity(0.6),
  //     builder: (context) => Center(
  //       child: Container(
  //         padding: const EdgeInsets.all(20.0),
  //         decoration: BoxDecoration(
  //           color: kGrey3,
  //           borderRadius: BorderRadius.circular(8.0),
  //         ),
  //         child: ref.watch(loadingVerifyTransactionPin) == true
  //             ? const CircularProgressIndicator(
  //                 color: kPrimary,
  //               )
  //             : Container(),
  //       ),
  //     ),
  //   );

  //   Close the dialog after 5 seconds
  //   ref.watch(loadingVerifyTransactionPin) == false
  //       ? Future.delayed(const Duration(seconds: 10), () {
  //           setState(() {
  //             pinCode = [];
  //             Navigator.of(context).pop(true);
  //           });
  //         })
  //       : null;
  // }

  @override
  void initState() {
    super.initState();
    // userFingerPrintAuth(context: context, proceedAuth: onAuthenticationSuccess);
  }

  @override
  Widget build(BuildContext context) {
    // final darkMode = ref.watch(darkModeProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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
                    'Create New Pin',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: kBlack,
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 200),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 80, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const AppHeader(heading: 'Confirm PIN'),
                  SizedBox(height: 30),
                  Text(
                    'Add a pin number to make your account secure',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      width: 80,
                      height: 65,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 255, 255),
                          borderRadius: BorderRadius.circular(8),
                          border: pinCode.length == i
                              ? Border.all(color: kPrimary, width: 2)
                              : Border.all(
                                  color: const Color.fromARGB(
                                      255, 243, 245, 245))),
                      child: Center(
                        child: Text(
                          pinCode.length > i ? '*' : '',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GlobalBtn(
                height: 50,
                width: double.infinity,
                btColor: kPrimary,
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.white, // Optional: Text color
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 253, 255, 255),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 12,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 20,
                          childAspectRatio: 2,
                        ),
                        itemBuilder: (context, index) {
                          if (index == 9) {
                            return PinCodeButton(
                              onPressed: () {
                                // Call userFingerPrintAuth and provide the callback function
                                // userFingerPrintAuth(
                                //   context: context,
                                //   proceedAuth: onAuthenticationSuccess,
                                // );
                              },
                              child: const Text(
                                '*',
                                style: TextStyle(color: kPrimary, fontSize: 20),
                              ),
                            );
                          } else if (index == 11) {
                            return PinCodeButton(
                              onPressed: _deleteFromPinCode,
                              child: const Icon(
                                Icons.backspace_outlined,
                                color: kBlack,
                              ),
                            );
                          } else if (index == 10) {
                            return PinCodeButton(
                              onPressed: () => _addToPinCode('0'),
                              text: '0',
                            );
                          } else {
                            final digit = index + 1;
                            return PinCodeButton(
                              onPressed: () => _addToPinCode(digit.toString()),
                              text: digit.toString(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
