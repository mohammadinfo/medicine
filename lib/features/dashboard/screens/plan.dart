import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:medicine/core/mock_models.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key, required this.title, required this.plans});

  final String title;
  final List<MockPlan> plans;

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView.builder(
        itemCount: widget.plans.length,
        itemBuilder: (context, index) {
          var plan = widget.plans[index];
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  imageUrl: plan.planMedia,
                  progressIndicatorBuilder: (context, url, progress) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  },
                  width: 300.0,
                  height: 300.0,
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                plan.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12.0),
              Text(plan.description),
              const SizedBox(height: 12.0),
              Directionality(
                textDirection: TextDirection.ltr,
                child: TimerCountdown(
                  secondsDescription: 'ثانیه',
                  minutesDescription: 'دقیقه',
                  descriptionTextStyle:
                      const TextStyle(fontWeight: FontWeight.w700),
                  timeTextStyle: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                  spacerWidth: 6.0,
                  enableDescriptions: true,
                  format: CountDownTimerFormat.minutesSeconds,
                  endTime: DateTime.now().add(
                    Duration(seconds: plan.durationInSecond),
                  ),
                  onEnd: () {},
                ),
              ),
              const Spacer(),
              Text('حرکت ${index + 1} از ${widget.plans.length}'),
              const SizedBox(height: 12.0),
            ],
          );
        },
      ),
    );
  }
}
