import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:medicine/core/utils.dart';
import 'package:medicine/core/widgets/loading_items_widget.dart';
import 'package:medicine/features/dashboard/bloc/client_bloc.dart';
import 'package:medicine/features/dashboard/bloc/client_events.dart';
import 'package:medicine/features/dashboard/bloc/client_states.dart';
import 'package:medicine/features/dashboard/screens/detail_plan.dart';
import 'package:medicine/features/dashboard/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<ClientBloc>(context).add(FetchAllPlans());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فیزیولاین'),
      ),
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
                title: const Text('پروفایل'),
                leading: const Icon(Icons.person),
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
                onTap: () {
                  Get.back();
                  Get.to(const SettingsScreen());
                },
                title: const Text('تنظیمات'),
                leading: const Icon(Icons.settings),
              ),
              ListTile(
                onTap: () {
                  Get.back();
                  Get.defaultDialog(
                    title: 'هشدار',
                    titleStyle: Theme.of(context).textTheme.bodyMedium,
                    content: Text(
                      'آیا میخواهید خارج شوید ؟',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    confirm: TextButton(
                      onPressed: () {
                        Get.back();
                        exit(0);
                      },
                      child: const Text('بله'),
                    ),
                    cancel: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('خیر'),
                    ),
                  );
                },
                title: const Text('خروج'),
                leading: const Icon(Icons.exit_to_app_rounded),
              ),
            ],
          ),
        ),
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
            Text(
              'برنامه های درمانی',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 16.0),
            BlocBuilder<ClientBloc, ClientState>(
              buildWhen: (previous, current) {
                if (current is AllPlansLoading ||
                    current is AllPlansSuccess ||
                    current is AllPlansError) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is AllPlansLoading) {
                  return buildShimmerEffect();
                } else if (state is AllPlansSuccess) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.plans.length,
                    itemBuilder: (context, index) {
                      var plan = state.plans[index];
                      return Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: (plan.isActive ?? false)
                              ? const BorderSide(
                                  color: Colors.green,
                                  width: 0.5,
                                )
                              : BorderSide.none,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12.0,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://www.tarhdokan.com/wp-content/uploads/2020/07/doctor-1-1.jpg',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('نام دکتر'),
                                        Text('تخصص دکتر'),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'تاریخ شروع\n${plan.startDate!.toShamsi}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              minVerticalPadding: 0.0,
                              title: Text((plan.title ?? '')),
                              subtitle: Text((plan.description ?? '')),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 16.0,
                              ),
                              width: MediaQuery.sizeOf(context).width,
                              height: 45.0,
                              child: OutlinedButton(
                                onPressed: () {
                                  Get.to(DetailPlanScreen(plan: plan));
                                },
                                child: const Text('مشاهده جزییات'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 8.0);
                    },
                  );
                } else if (state is AllPlansError) {
                  return Center(
                    child: TextButton.icon(
                      label: const Text("An error occurred"),
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        BlocProvider.of<ClientBloc>(context)
                            .add(FetchAllPlans());
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
