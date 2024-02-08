import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medicine/features/authentication/screens/login.dart';
import 'package:medicine/features/authentication/screens/register.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/doctors.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: const Text(''),
                ),
              ),
              Positioned(
                bottom: 80.0,
                right: 16.0,
                left: 16.0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 150.0,
                    ),
                    Text(
                      'فیزیولاین',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 45.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'با فیزیولاین، کلینیک فیزیوتراپی در جیب شما',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Text(
                        'فیزیولاین پلتفرم برخط ارائه خدمات دوراپزشکی در حوزه درمانی فیزیوتراپی و توانبخشی بدنی، مبتنی بر ایجاد ارتباط آسان بین پزشک و بیمار است.',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150.0, 50.0),
                      ),
                      onPressed: () {
                        Get.to(const LoginScreen());
                      },
                      child: Text(
                        'ورود',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150.0, 50.0),
                      ),
                      onPressed: () {
                        Get.to(const RegisterScreen());
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
      ),
    );
  }
}
