import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medicine/core/mock_models.dart';
import 'package:medicine/features/dashboard/screens/plan.dart';

class DetailPlanScreen extends StatefulWidget {
  const DetailPlanScreen({super.key, required this.userPlan});

  final MockUserPlan userPlan;

  @override
  State<DetailPlanScreen> createState() => _DetailPlanScreenState();
}

class _DetailPlanScreenState extends State<DetailPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('برنامه ${widget.userPlan.title}'),
      ),
      body: ListView.builder(
        itemCount: widget.userPlan.details.length,
        itemBuilder: (context, index) {
          var userPlanDetailItem = widget.userPlan.details[index];
          return ListTile(
            onTap: () {
              Get.to(
                PlanScreen(
                  title: userPlanDetailItem.title,
                  plans: userPlanDetailItem.mockPlanList,
                ),
              );
            },
            title: Text(userPlanDetailItem.title),
            subtitle: Text(userPlanDetailItem.description),
            leading: CircleAvatar(child: Text('${index + 1}')),
            trailing: Text(
              '${userPlanDetailItem.mockPlanList.length} حرکت\n${userPlanDetailItem.durationInMinutes} دقیقه',
            ),
          );
        },
      ),
    );
  }
}
