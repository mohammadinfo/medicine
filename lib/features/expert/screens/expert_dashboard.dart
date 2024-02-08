import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:medicine/features/expert/screens/add_exercise.dart';
import 'package:medicine/features/expert/screens/exercise_category_create.dart';

class ExpertDashboardScreen extends StatefulWidget {
  const ExpertDashboardScreen({super.key});

  @override
  State<ExpertDashboardScreen> createState() => _ExpertDashboardScreenState();
}

class _ExpertDashboardScreenState extends State<ExpertDashboardScreen> {
  List<String> expertFeatures = [
    'دسته بندی تمرین',
    'افزودن تمرین',
    'دسته بندی کالکشن',
    'افزودن کالکشن',
    'کالکشن دیتیل',
    'پلن',
    'پلن دیتیل'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فیزیولاین دکتر'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall,
                    text: 'خوش اومدی ',
                    children: [
                      TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                        text: 'دکتر حسینی',
                      ),
                    ],
                  ),
                ),
                LottieBuilder.asset('assets/animations/love.json'),
              ],
            ),
            const Divider(),
            const SizedBox(height: 16.0),
            GridView.builder(
              shrinkWrap: true,
              itemCount: expertFeatures.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 1,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
              ),
              itemBuilder: (context, index) {
                var expertFeature = expertFeatures[index];
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () {
                        switch (index) {
                          case 0:
                            Get.to(const ExerciseCategoryCreateScreen());
                            break;
                          case 1:
                            Get.to(const AddExerciseScreen());
                            break;
                          default:
                        }
                      },
                      child: Text(expertFeature),
                    ),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        child: Text(
                          'مرحله ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
