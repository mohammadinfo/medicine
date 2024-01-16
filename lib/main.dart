import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medicine/features/authentication/screens/welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'پزشکیار',
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa'),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
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
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
