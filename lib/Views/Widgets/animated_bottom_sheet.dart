import 'package:flutter/material.dart';

animatedBottomSheet({
  required BuildContext context,
  required AnimationController animationController,
  required double screenWidth,
  required Widget body,
  Color? backgroundColor,
}) async {
  Future bottomSheet = showModalBottomSheet(
      transitionAnimationController: animationController,
      barrierColor: backgroundColor ?? Colors.white.withOpacity(.2),
      isDismissible: true,
      enableDrag: true,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .85),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      context: context,
      useRootNavigator: false,
      builder: (context) {
        return BodyWidget(
            child: Padding(
          padding: EdgeInsets.only(
              top: 10, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: body,
          ),
        ));
      });

  return bottomSheet;
}

class BodyWidget extends StatefulWidget {
  final Widget child;
  const BodyWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
