import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('پزشکیار')),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              LottieBuilder.asset(
                'assets/animations/welcome.json',
                width: 200.0,
              ),
              ListTile(
                onTap: () {},
                title: const Text('تماس با پزشک'),
                leading: const RotatedBox(
                  quarterTurns: -1,
                  child: Icon(Icons.call),
                ),
              ),
              ListTile(
                onTap: () {},
                title: const Text('تاریخچه'),
                leading: const Icon(Icons.history),
              ),
              ListTile(
                onTap: () {},
                title: const Text('تنظیمات'),
                leading: const Icon(Icons.settings),
              ),
              ListTile(
                onTap: () {},
                title: const Text('خروج'),
                leading: const Icon(Icons.exit_to_app_rounded),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        text: 'محمد حسینی',
                      ),
                    ],
                  ),
                ),
                LottieBuilder.asset('assets/animations/love.json'),
              ],
            ),
            const Divider(),
            const SizedBox(height: 16.0),
            Center(
              child: DashedCircularProgressBar(
                width: 200.0,
                height: 200.0,
                valueNotifier: _valueNotifier,
                progress: 37,
                startAngle: 225,
                sweepAngle: 270,
                foregroundColor: Colors.green,
                backgroundColor: const Color(0xffeeeeee),
                foregroundStrokeWidth: 15,
                backgroundStrokeWidth: 15,
                animation: true,
                seekSize: 6,
                seekColor: const Color(0xffeeeeee),
                child: Center(
                  child: ValueListenableBuilder(
                      valueListenable: _valueNotifier,
                      builder: (_, double value, __) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${value.toInt()}%',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 40,
                                ),
                              ),
                              const Text(
                                'نمودار پیشرفت',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )),
                ),
              ),
            ),
            Text(
              'برنامه هفتگی بیمار',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 16.0),
            ListView.separated(
              shrinkWrap: true,
              itemCount: MockUserPlan.list.length,
              itemBuilder: (context, index) {
                var plan = MockUserPlan.list[index];
                return Card(
                  margin: EdgeInsets.zero,
                  child: ListTile(
                    onTap: () {},
                    trailing: plan.isDone ? const Icon(Icons.check) : null,
                    title: Text(plan.title),
                    subtitle: Text(plan.date),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: plan.isDone
                          ? const BorderSide(
                              color: Colors.green,
                              width: 1.0,
                            )
                          : BorderSide.none,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8.0);
              },
            ),
          ],
        ),
      ),
    );
  }
}

//
class MockUserPlan {
  int id;
  String title;
  String date;
  bool isDone;
  MockUserPlan({
    required this.id,
    required this.title,
    required this.date,
    required this.isDone,
  });

  static List<MockUserPlan> list = [
    MockUserPlan(
      id: 1,
      title: 'شنبه',
      date: '1402/01/01',
      isDone: true,
    ),
    MockUserPlan(
      id: 2,
      title: 'یک شنبه',
      date: '1402/02/07',
      isDone: true,
    ),
    MockUserPlan(
      id: 3,
      title: 'دو شنبه',
      date: '1402/03/09',
      isDone: false,
    ),
    MockUserPlan(
      id: 3,
      title: 'سه شنبه',
      date: '1402/02/02',
      isDone: false,
    ),
  ];
}
