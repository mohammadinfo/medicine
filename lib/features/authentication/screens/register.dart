import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medicine/features/dashboard/screens/home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isNotVisiblePassword = false;
  bool isNotVisibleConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/animations/register.json',
              width: 250.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'نام کاربری',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'ایمیل',
                    ),
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
                  TextField(
                    obscureText: isNotVisibleConfirmPassword,
                    decoration: InputDecoration(
                      hintText: 'تکرار رمز عبور',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isNotVisibleConfirmPassword =
                                !isNotVisibleConfirmPassword;
                          });
                        },
                        icon: Icon(isNotVisibleConfirmPassword
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
                      'ثبت نام',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
