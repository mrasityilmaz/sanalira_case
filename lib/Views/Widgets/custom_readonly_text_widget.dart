import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanalira_case/Theme/Ui-Constants/colors.dart';

class CustomReadOnlyTextFieldWidget extends StatelessWidget {
  const CustomReadOnlyTextFieldWidget({Key? key, required this.fieldTitle, required this.fieldText}) : super(key: key);

  final String fieldTitle;

  final String fieldText;

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
          TextField(
            readOnly: true,
            controller: TextEditingController(text: fieldText),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
            textAlignVertical: TextAlignVertical.bottom,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
                fillColor: readOnlyFieldBgColor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: readOnlyFieldBgColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: readOnlyFieldBgColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: readOnlyFieldBgColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.copy,
                      color: mainGreen,
                    )),
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
          ),
        ],
      ),
    );
  }
}
