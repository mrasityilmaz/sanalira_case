import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanalira_case/Core/Bloc/bank_bloc.dart';
import 'package:sanalira_case/Core/Bloc/bank_event.dart';
import 'package:sanalira_case/Core/Bloc/bank_state.dart';
import 'package:sanalira_case/Data/Models/bank_model.dart';
import 'package:sanalira_case/Theme/Ui-Constants/colors.dart';
import 'package:sanalira_case/Views/Widgets/bank_row_widget.dart';
import 'package:sanalira_case/Views/Widgets/custom_app_bar.dart';
import 'package:sanalira_case/Views/Widgets/custom_bottom_nav_bar.dart';
import 'package:sanalira_case/Views/Widgets/personel_row_widget.dart';
import 'package:sanalira_case/assets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    animation = Tween<double>(begin: 1, end: 5).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BankBloc>(context);
    return Scaffold(
      backgroundColor: mainBgColor,
      appBar: const CustomAppBar().build(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16) + const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PersonInfoRowWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Türk lirası yatırmak için banka seçiniz.", textAlign: TextAlign.left, style: GoogleFonts.inter(color: subtitleGrey, fontWeight: FontWeight.w400, fontSize: 18)),
            ),
            BlocListener(
              bloc: bloc,
              listener: (context, state) {
                if (state is LoadingState) {
                  showDialog(
                    barrierColor: mainGreen.withOpacity(.3),
                    context: context,
                    builder: (context) {
                      controller.forward();
                      return AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return Transform.scale(scale: animation.value * .1, child: child);
                        },
                        child: Image.asset(
                          Assets.assets_icons_main_icon_png,
                          height: 80,
                          width: 80,
                        ),
                      );
                    },
                  );
                } else {
                  Navigator.pop(context);
                  controller.reset();
                  controller.stop();
                }
              },
              child: BlocBuilder(
                // Api isteği atılıyor
                bloc: bloc..add(const FetchAllBanks()),
                builder: (context, state) {
                  // API'den dönen yanıta göre farklı dönüşler sağlanıyor.
                  if (state is SuccessState) {
                    final result = state.response.response as BankModel;
                    return Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: BankRowWidget(bankDetail: result.data![index]),
                      ),
                      itemCount: result.data?.length ?? 0,
                    ));
                  } else if (state is FailureState) {
                    return Expanded(
                        child: Column(
                      children: [Text(state.failure.errorMessage.toString())],
                    ));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBarWidget(),
    );
  }
}
