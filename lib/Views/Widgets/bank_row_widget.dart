import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanalira_case/Data/Models/bank_model.dart';
import 'package:sanalira_case/Theme/Ui-Constants/colors.dart';
import 'package:sanalira_case/Views/Widgets/custom_readonly_text_widget.dart';

import 'package:sanalira_case/assets.dart';

class BankRowWidget extends StatefulWidget {
  final Data bankDetail;
  const BankRowWidget({
    Key? key,
    required this.bankDetail,
  }) : super(key: key);

  @override
  State<BankRowWidget> createState() => _BankRowWidgetState();
}

class _BankRowWidgetState extends State<BankRowWidget> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  initState() {
    super.initState();
    animationController = BottomSheet.createAnimationController(this);
    animationController.drive(CurveTween(curve: Curves.easeInOut));

    animationController.duration = const Duration(milliseconds: 350);
    animationController.reverseDuration = const Duration(milliseconds: 350);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero, elevation: 0.5, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      onPressed: () async {
        await showModalBottomSheet(
            isScrollControlled: true,
            transitionAnimationController: animationController,
            context: context,
            backgroundColor: Colors.transparent,
            barrierColor: const Color(0xFF131313).withOpacity(.76),
            elevation: 5,
            useRootNavigator: true,
            isDismissible: true,
            enableDrag: true,
            builder: ((context) {
              return Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(15)), color: Colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      height: 5,
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(6)),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomReadOnlyTextFieldWidget(fieldTitle: "Hesap Adı", fieldText: widget.bankDetail.bankAccountName!),
                    CustomReadOnlyTextFieldWidget(fieldTitle: "IBAN", fieldText: widget.bankDetail.bankIban!),
                    CustomReadOnlyTextFieldWidget(fieldTitle: "Açıklama", fieldText: widget.bankDetail.descriptionNo!),
                    Container(
                      decoration: BoxDecoration(
                        color: readOnlyFieldBgColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Text(
                        "Lütfen havale yaparken açıklama alanına yukarıdaki kodu yazmayı unutmayın.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(color: subtitleGreyTwo, fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: warningBgRed,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Text(
                        "Lütfen havale yaparken açıklama alanına yukarıdaki kodu yazmayı unutmayın.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(color: Colors.red, fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: kBottomNavigationBarHeight + 32,
                    ),
                  ],
                ),
              );
            }));
      },
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: DottedBorder(
                borderType: BorderType.RRect,
                color: subtitleGrey,
                radius: const Radius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    getImageName(widget.bankDetail.bankName?.toLowerCase() ?? "ziraat"),
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.bankDetail.bankName!, style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16)),
                    Text("Havale / EFT ile para gönderin.", style: GoogleFonts.inter(color: subtitleGrey, fontWeight: FontWeight.w400, fontSize: 15))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  String getImageName(String name) {
    if (name.contains("ziraat")) {
      return Assets.assets_icons_Ziraat_Bankasi_logo_png;
    } else if (name.contains("albaraka")) {
      return Assets.assets_icons_albaraka_png;
    } else if (name.contains("vakiflar")) {
      return Assets.assets_icons_vakifbank_png;
    } else if (name.contains("akbank")) {
      return Assets.assets_icons_akbank_png;
    } else if (name.contains("kuveyt")) {
      return Assets.assets_icons_kuveyt_png;
    } else if (name.contains("garanti")) {
      return Assets.assets_icons_garanti_jpg;
    } else if (name.contains("finansban")) {
      return Assets.assets_icons_qnb_png;
    } else {
      return Assets.assets_icons_Ziraat_Bankasi_logo_png;
    }
  }
}
