import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabi_savis/src/config/colors.dart';

class GeneralTextField extends ConsumerWidget {
  GeneralTextField(
      {Key? key,
      this.hintText,
      this.heading,
      this.keyboardType,
      required this.controller,
      this.validator,
      this.onChanged,
      this.suffixIcon,
      this.prefixIcon,
      this.maxLines,
      this.minLines,
      this.maxLength,
      this.iconName,
      this.filledColor,
      this.readOnly,
      this.textAlign,
      this.inputFormatters,
      required this.onTap,
      this.autoFillHints,
      this.obscureText,
      this.sizeBoxheight,
      this.textCapitalization,
      this.sizeBoxheight2,
      this.expands})
      : super(key: key);
  final String? hintText;
  final double? sizeBoxheight;
  final double? sizeBoxheight2;
  final String? heading;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final IconData? iconName;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  VoidCallback onTap;
  final int? maxLines, minLines;
  final int? maxLength;
  final Color? filledColor;
  final bool? readOnly;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autoFillHints;
  bool? obscureText;
  bool? expands;
  TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final darkMode = ref.watch(darkModeProvider);
    return Consumer(
      builder: (context, ref, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading ?? '',
            ),
            SizedBox(height: sizeBoxheight ?? 0),
            SizedBox(
              height: sizeBoxheight2,
              child: TextFormField(
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                expands: expands ?? false,
                obscureText: obscureText ?? false,
                controller: controller,
                validator: validator,
                minLines: maxLines,
                maxLines: maxLines,
                maxLength: maxLength,
                inputFormatters: inputFormatters,
                readOnly: readOnly ?? false,
                enableSuggestions: true,
                enableInteractiveSelection: true,
                cursorColor: kPrimary,
                textAlign: textAlign ?? TextAlign.start,
                autofillHints: autoFillHints,
                textInputAction:
                    TextInputAction.done, // set the text input action to done
                onTap: () {
                  onTap();
                  // ref.watch(isEditingProvider.notifier).state = true;
                },
                onChanged: (value) {
                  // ref.watch(isEditingProvider.notifier).state = false;

                  if (value.isEmpty) {
                    // ref.watch(isEditingProvider.notifier).state = true;
                  }
                },

                onFieldSubmitted: (value) {
                  // ref.watch(isEditingProvider.notifier).state = false;
                },
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                  // ref.watch(isEditingProvider.notifier).state = false;
                },
                keyboardType: keyboardType,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  filled: true,
                  fillColor: filledColor ?? kWhite,
                  hintText: hintText,
                  counterText: '',
                  prefixIcon: iconName == null
                      ? null
                      : Icon(
                          iconName,
                          color: kGrey5,
                          size: 20,
                        ),
                  suffixIcon: suffixIcon,
                  hintStyle: const TextStyle(fontSize: 15, color: kGrey5),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kPrimary),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: kWhite)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: kRed)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: kRed)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
