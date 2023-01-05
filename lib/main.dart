import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanalira_case/Core/Bloc/bank_bloc.dart';
import 'package:sanalira_case/Core/Repository/repository.dart';
import 'package:sanalira_case/Views/Screens/login_screen.dart';
import 'package:sanalira_case/Views/Screens/main_screen.dart';
import 'package:sanalira_case/Views/Widgets/custom_splash_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Core/DataProvider/data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DataProvider dataProvider = DataProvider();

  Repository repository = Repository(dataProvider: dataProvider);
  runApp(BlocProvider(create: (_) => BankBloc(serviceRepository: repository), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainAppWidget(),
    );
  }
}

class MainAppWidget extends StatelessWidget {
  const MainAppWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1), () {
          return SharedPreferences.getInstance().then((value) => value.getBool("auth"));
        }),
        builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomSplashWidget();
          } else {
            if (snapshot.data == true) {
              return const MainScreen();
            } else {
              return const LoginScreen();
            }
          }
        },
      ),
    );
  }
}
