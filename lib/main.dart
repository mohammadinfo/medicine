import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medicine/features/authentication/screens/welcome.dart';
import 'package:medicine/features/dashboard/bloc/client_bloc.dart';
import 'package:medicine/features/dashboard/data/services/api_methods.dart';
import 'package:medicine/features/dashboard/screens/settings.dart';
import 'package:medicine/features/expert/bloc/expert_bloc.dart';
import 'package:medicine/features/expert/data/services/api_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserRule {
  user,
  admin,
  expert,
}

UserRule userRule = UserRule.expert;

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  textSizeValue.value = prefs.getDouble('textSizeValue') ?? 1.0;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ClientBloc(ApiClient())),
        BlocProvider(create: (context) => ExpertBloc(ExpertApiClient())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: textSizeValue,
      builder: (context, value, child) => GetMaterialApp(
        title: 'فیزیولاین',
        debugShowCheckedModeBanner: false,
        locale: const Locale('fa'),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(textSizeValue.value),
            ),
            child: child as Widget,
          );
        },
        theme: ThemeData(
          fontFamily: 'YekanBakh',
          platform: TargetPlatform.iOS,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF37C3F0),
          ),
          useMaterial3: true,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
