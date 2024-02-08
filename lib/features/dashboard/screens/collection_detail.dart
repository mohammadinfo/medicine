import 'package:adaptive_shimmer/adaptive_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medicine/core/widgets/loading_items_widget.dart';
import 'package:medicine/features/dashboard/bloc/client_bloc.dart';
import 'package:medicine/features/dashboard/bloc/client_events.dart';
import 'package:medicine/features/dashboard/bloc/client_states.dart';
import 'package:medicine/features/dashboard/data/models/models.dart';
import 'package:medicine/features/dashboard/screens/exercise.dart';

class CollectionDetailScreen extends StatefulWidget {
  const CollectionDetailScreen({super.key, required this.planDetail});

  final PlanDetail planDetail;

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ClientBloc>(context)
        .add(FetchCollectionDetailById(widget.planDetail.collectionId!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'تمرینات',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: BlocBuilder<ClientBloc, ClientState>(
          buildWhen: (previous, current) {
            if (current is CollectionDetailLoading ||
                current is CollectionDetailSuccess ||
                current is CollectionDetailError) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state is CollectionDetailLoading) {
              return AdaptiveShimmer(
                loading: true,
                child: buildCollectionList(
                  List.generate(
                    20,
                    (index) => CollectionDetail(),
                  ),
                ),
              );
            } else if (state is CollectionDetailSuccess) {
              if (state.collections.isEmpty) {
                return const Center(
                  child: Text('آیتمی موجود نیست...'),
                );
              }
              return buildCollectionList(state.collections);
            } else if (state is CollectionDetailError) {
              return Center(
                child: TextButton.icon(
                  label: const Text("An error occurred"),
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    BlocProvider.of<ClientBloc>(context).add(
                      FetchCollectionDetailById(
                          widget.planDetail.collectionId!),
                    );
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }

  ListView buildCollectionList(List<CollectionDetail> collections) {
    return ListView.separated(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        var collectionDetail = collections[index];
        return InkWell(
          enableFeedback: true,
          borderRadius: BorderRadius.circular(6.0),
          onTap: () {
            Get.to(
              ExerciseScreen(
                collectionDetail: collectionDetail,
                collections: collections,
              ),
            );
          },
          child: Column(
            children: [
              ListTile(
                title: Text('تمرین شماره ${index + 1}'),
                leading: CircleAvatar(child: Text('${index + 1}')),
              ),
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
    );
  }
}
