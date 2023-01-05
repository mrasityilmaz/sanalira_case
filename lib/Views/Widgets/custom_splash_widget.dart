import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanalira_case/assets.dart';

class CustomSplashWidget extends StatelessWidget {
  const CustomSplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assets_icons_main_icon_png,
              height: 120,
              width: 120,
            ),
            const SizedBox(
              height: 8,
            ),
            Text("SanaLira", style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26))
          ],
        ),
      ),
    );
  }
}
