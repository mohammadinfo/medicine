import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:medicine/features/dashboard/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isNotVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/animations/welcome.json',
              width: 300.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(hintText: 'ایمیل'),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    obscureText: isNotVisiblePassword,
                    decoration: InputDecoration(
                      hintText: 'رمز عبور',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isNotVisiblePassword = !isNotVisiblePassword;
                          });
                        },
                        icon: Icon(isNotVisiblePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        MediaQuery.sizeOf(context).width,
                        50.0,
                      ),
                    ),
                    onPressed: () {
                      Get.offAll(const HomeScreen());
                    },
                    child: Text(
                      'ورود',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  TextButton(
                    onPressed: () {},
                    child: const Text('فراموشی رمز عبور'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
