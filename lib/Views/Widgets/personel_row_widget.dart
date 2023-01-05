import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanalira_case/Theme/Ui-Constants/colors.dart';
import 'package:sanalira_case/assets.dart';

class PersonInfoRowWidget extends StatelessWidget {
  const PersonInfoRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.assets_icons_turkey_svg,
            height: 40,
            width: 40,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Türk Lirası", style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20)),
              Text("TL", style: GoogleFonts.inter(color: subtitleGrey, fontWeight: FontWeight.w400, fontSize: 16))
            ],
          )),
          Text("234 ₺", style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20))
        ],
      ),
    );
  }
}
