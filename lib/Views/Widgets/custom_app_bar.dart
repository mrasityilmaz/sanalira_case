import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanalira_case/Theme/Ui-Constants/colors.dart';
import 'package:sanalira_case/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size(0, kToolbarHeight),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FractionallySizedBox(
                    heightFactor: .5,
                    widthFactor: .5,
                    child: SvgPicture.asset(
                      Assets.assets_icons_left_arrow_svg,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FractionallySizedBox(
                    heightFactor: .5,
                    widthFactor: .5,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: SvgPicture.asset(
                            Assets.assets_icons_bell_svg,
                            color: Colors.black,
                          ),
                        ),
                        Positioned.directional(
                          top: 0,
                          end: 0,
                          textDirection: TextDirection.ltr,
                          child: const Icon(
                            Icons.circle,
                            size: 12,
                            color: mainGreen,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FractionallySizedBox(
                    heightFactor: .5,
                    widthFactor: .5,
                    child: SvgPicture.asset(
                      Assets.assets_icons_settings_svg,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
