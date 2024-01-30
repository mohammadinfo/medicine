import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medicine/core/widgets/loading_items_widget.dart';
import 'package:medicine/features/dashboard/bloc/client_bloc.dart';
import 'package:medicine/features/dashboard/bloc/client_events.dart';
import 'package:medicine/features/dashboard/bloc/client_states.dart';
import 'package:medicine/features/dashboard/data/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key, required this.collectionDetail});

  final CollectionDetail collectionDetail;

  @override
  State<ExerciseScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<ExerciseScreen> {
  bool isPlanStarted = false;
  PageController pageController = PageController();

  @override
  void initState() {
    BlocProvider.of<ClientBloc>(context)
        .add(FetchExerciseDetailById(widget.collectionDetail.exerciseId!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        if (state is ExerciseDetailLoading) {
          return Scaffold(
            appBar: AppBar(),
            body: buildShimmerEffect(),
          );
        } else if (state is ExerciseDetailSuccess) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12.0)),
                      ),
                      builder: (context) {
                        return Container(
                            padding: const EdgeInsets.only(right: 16.0),
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height / 2,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12.0)),
                            ),
                            child: ListView.separated(
                              itemCount:
                                  state.exerciseDetail.guideReferences!.length,
                              itemBuilder: (context, index) {
                                var guideReference = state
                                    .exerciseDetail.guideReferences![index];

                                return ListTile(
                                  onTap: () {
                                    launchUrl(
                                      Uri.parse(guideReference.url!),
                                      mode: LaunchMode.externalApplication,
                                    );
                                    Get.back();
                                  },
                                  title: Text(guideReference.title ?? ''),
                                  trailing: TextButton(
                                    onPressed: () {
                                      launchUrl(
                                        Uri.parse(guideReference.url!),
                                        mode: LaunchMode.externalApplication,
                                      );
                                      Get.back();
                                    },
                                    child: const Text('کلیک کنید'),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider();
                              },
                            ));
                      },
                    );
                  },
                  icon: const Icon(Icons.help),
                ),
                // Game
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.games),
                ),
              ],
            ),
            body: PageView.builder(
              controller: pageController,
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var exercise = state.exerciseDetail;
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedNetworkImage(
                        // imageUrl:
                        //     'https://alinorouzi.ir/images/${exercise.picturePath}',
                        imageUrl: 'https://i.giphy.com/fxTjIbF7S5IWn4iltt.webp',
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
                      exercise.title ?? '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 12.0),
                    Text(exercise.shortDescription ?? ''),
                    const SizedBox(height: 12.0),
                    !isPlanStarted
                        ? ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                isPlanStarted = true;
                              });
                            },
                            label: const Text('شروع'),
                            icon: const Icon(Icons.play_arrow),
                          )
                        : Column(
                            children: [
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: TimerCountdown(
                                  secondsDescription: 'ثانیه',
                                  minutesDescription: 'دقیقه',
                                  descriptionTextStyle: const TextStyle(
                                      fontWeight: FontWeight.w700),
                                  timeTextStyle: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  spacerWidth: 6.0,
                                  enableDescriptions: true,
                                  format: CountDownTimerFormat.minutesSeconds,
                                  endTime: DateTime.now().add(
                                    Duration(
                                        seconds: widget.collectionDetail
                                                .secondsOfDuration ??
                                            0),
                                  ),
                                  onEnd: () {
                                    setState(() {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('وقت شما تمام شد...'),
                                        ),
                                      );
                                      isPlanStarted = false;
                                    });
                                  },
                                ),
                              ),

                              /*
                                const SizedBox(height: 16.0),
                                
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: pageController.page == 0
                                          ? null
                                          : () async {
                                              await pageController.previousPage(
                                                duration: Durations.medium1,
                                                curve: Curves.linear,
                                              );
                                              setState(() {});
                                            },
                                      child: const Text('حرکت قبلی'),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                      ),
                                      onPressed: pageController.page ==
                                              (widget.plans.length - 1)
                                          ? null
                                          : () async {
                                              await pageController.nextPage(
                                                duration: Durations.medium1,
                                                curve: Curves.linear,
                                              );
                                              setState(() {});
                                            },
                                      child: const Text(
                                        'حرکت بعدی',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    minimumSize: Size(
                                      MediaQuery.sizeOf(context).width / 2,
                                      45.0,
                                    ),
                                  ),
                                  onPressed: () {},
                                  label: const Text(
                                    'انجام دادم',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.emoji_emotions,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    minimumSize: Size(
                                      MediaQuery.sizeOf(context).width / 2,
                                      45.0,
                                    ),
                                  ),
                                  onPressed: () {},
                                  label: const Text(
                                    'انجام ندادم',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.error,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                      const Spacer(),
                      Text('حرکت ${index + 1} از ${widget.plans.length}'),
                      const SizedBox(height: 12.0),
                      */
                            ],
                          ),
                  ],
                );
              },
            ),
          );
        } else if (state is ExerciseDetailError) {
          return Center(
            child: TextButton.icon(
              label: const Text("An error occurred"),
              icon: const Icon(Icons.refresh),
              onPressed: () {},
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
