import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medicine/core/mock_models.dart';
import 'package:medicine/core/utils.dart';
import 'package:medicine/core/widgets/loading_items_widget.dart';
import 'package:medicine/features/dashboard/bloc/client_bloc.dart';
import 'package:medicine/features/dashboard/bloc/client_events.dart';
import 'package:medicine/features/dashboard/bloc/client_states.dart';
import 'package:medicine/features/dashboard/data/models/models.dart';
import 'package:medicine/features/dashboard/screens/collection_detail.dart';
import 'package:medicine/features/dashboard/screens/exercise.dart';

class DetailPlanScreen extends StatefulWidget {
  const DetailPlanScreen({
    super.key,
    required this.plan,
  });

  final Plan plan;

  @override
  State<DetailPlanScreen> createState() => _DetailPlanScreenState();
}

class _DetailPlanScreenState extends State<DetailPlanScreen> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    BlocProvider.of<ClientBloc>(context)
        .add(FetchPlanDetailsById(widget.plan.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'برنامه ${widget.plan.title}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: BlocBuilder<ClientBloc, ClientState>(
          buildWhen: (previous, current) {
            if (current is PlanDetailsLoading ||
                current is PlanDetailsSuccess ||
                current is PlanDetailsError) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state is PlanDetailsLoading) {
              return buildShimmerEffect();
            } else if (state is PlanDetailsSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Chart
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
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Plan Details List
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.planDetails.length,
                      itemBuilder: (context, index) {
                        var planDetail = state.planDetails[index];
                        return InkWell(
                          enableFeedback: true,
                          borderRadius: BorderRadius.circular(6.0),
                          onTap: () {
                            Get.to(
                                CollectionDetailScreen(planDetail: planDetail));
                          },
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('برنامه شماره ${index + 1}'),
                                leading:
                                    CircleAvatar(child: Text('${index + 1}')),
                              ),
                              SizedBox(
                                height: 40.0,
                                width: MediaQuery.sizeOf(context).width,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  shrinkWrap: true,
                                  itemCount: planDetail.weekDays?.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var day = sortedWeekDays(
                                        planDetail.weekDays!)[index];

                                    return TextButton(
                                      child: Text(day),
                                      onPressed: () {},
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          indent: 16.0,
                          endIndent: 16.0,
                        );
                      },
                    ),
                  ],
                ),
              );
            } else if (state is PlanDetailsError) {
              return Center(
                child: TextButton.icon(
                  label: const Text("An error occurred"),
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    BlocProvider.of<ClientBloc>(context)
                        .add(FetchPlanDetailsById(widget.plan.id!));
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
