import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanalira_case/assets.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  const CustomBottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: kElevationToShadow[2]),
      child: Padding(
        padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ) +
            EdgeInsets.only(bottom: 30, top: MediaQuery.of(context).padding.bottom > 10 ? MediaQuery.of(context).padding.bottom / 3 : 30 / 3),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SvgPicture.asset(
            Assets.assets_icons_hut_svg,
            height: 28,
            width: 28,
          ),
          SvgPicture.asset(
            Assets.assets_icons_transaction_svg,
            height: 28,
            width: 28,
          ),
          Container(
            height: 65,
            width: 65,
            decoration: const BoxDecoration(color: Color(0xFF252741), shape: BoxShape.circle),
            child: FractionallySizedBox(
              heightFactor: .45,
              widthFactor: .45,
              child: FittedBox(
                fit: BoxFit.contain,
                child: SvgPicture.asset(
                  Assets.assets_icons_Layer_2_svg,
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            Assets.assets_icons_Layer_1_svg,
            height: 28,
            width: 28,
          ),
          SvgPicture.asset(
            Assets.assets_icons_user_svg,
            height: 28,
            width: 28,
          ),
        ]),
      ),
    );
  }
}
