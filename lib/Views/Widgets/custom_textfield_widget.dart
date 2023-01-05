import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanalira_case/Theme/Ui-Constants/colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({Key? key, required this.currentFocusNode, this.nextFocusNode, required this.controller, required this.validator, required this.fieldTitle}) : super(key: key);

  final FocusNode currentFocusNode;
  final FocusNode? nextFocusNode;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String fieldTitle;

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
          TextFormField(
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
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
          ),
        ],
      ),
    );
  }
}
