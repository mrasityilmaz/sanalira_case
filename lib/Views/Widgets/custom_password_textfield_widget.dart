import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanalira_case/Theme/Ui-Constants/colors.dart';

class CustomPasswordTextFieldWidget extends StatelessWidget {
  CustomPasswordTextFieldWidget({Key? key, required this.currentFocusNode, this.nextFocusNode, required this.controller, required this.validator, required this.fieldTitle}) : super(key: key);

  final FocusNode currentFocusNode;
  final FocusNode? nextFocusNode;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String fieldTitle;
  final ValueNotifier<bool> showPassword = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fieldTitle, style: GoogleFonts.inter(color: subtitleGrey, fontWeight: FontWeight.w400, fontSize: 16)),
          const SizedBox(
            height: 8,
          ),
          ValueListenableBuilder(
            valueListenable: showPassword,
            builder: (BuildContext context, bool value, Widget? child) {
              return TextFormField(
                autofocus: true,
                validator: validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                focusNode: currentFocusNode,
                controller: controller,
                keyboardType: TextInputType.text,
                onEditingComplete: () {
                  if (nextFocusNode != null) {
                    FocusScope.of(context).requestFocus(nextFocusNode);
                  }
                },
                textInputAction: TextInputAction.next,
                style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                textAlignVertical: TextAlignVertical.center,
                obscuringCharacter: "•",
                obscureText: value,
                decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.red, width: 1)),
                    errorStyle: GoogleFonts.inter(
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    errorMaxLines: 3,
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        onPressed: () {
                          showPassword.value = !value;
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: const Icon(
                          size: 28,
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
              );
            },
          ),
        ],
      ),
    );
  }
}
