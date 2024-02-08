import 'package:adaptive_shimmer/adaptive_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine/core/snackbar.dart';
import 'package:medicine/features/expert/bloc/expert_bloc.dart';
import 'package:medicine/features/expert/data/models/models.dart';

class ExerciseCategoryCreateScreen extends StatefulWidget {
  const ExerciseCategoryCreateScreen({super.key});

  @override
  State<ExerciseCategoryCreateScreen> createState() =>
      _ExerciseCategoryCreateScreenState();
}

class _ExerciseCategoryCreateScreenState
    extends State<ExerciseCategoryCreateScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<ExpertBloc>(context).add(GetExerciseCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ایجاد دسته بندی تمرین'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'عنوان دسته بندی',
              ),
            ),
            TextField(
              controller: descriptionController,
              maxLines: 7,
              decoration: const InputDecoration(
                hintText: 'توضیحات دسته بندی',
              ),
            ),
            const SizedBox(height: 20.0),
            //! ذخیره دسته بندی
            BlocConsumer<ExpertBloc, ExpertState>(
              listener: (context, state) {
                if (state is ExerciseCategorySuccess) {
                  showCustomAlert(
                    context,
                    'دسته بندی با موفقیت ذخیره شد',
                    AlertType.success,
                  );
                  BlocProvider.of<ExpertBloc>(context)
                      .add(GetExerciseCategory());
                }
                if (state is ExerciseCategoryFailure) {
                  showCustomAlert(
                    context,
                    state.error,
                    AlertType.error,
                  );
                }
              },
              builder: (context, state) {
                return Center(
                  child: ElevatedButton(
                    onPressed: state is ExerciseCategoryLoading
                        ? null
                        : () {
                            FocusScope.of(context).unfocus();
                            BlocProvider.of<ExpertBloc>(context).add(
                              ExerciseCategoryCreate(
                                ExerciseCategoryRequest(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                ),
                              ),
                            );
                          },
                    child: const Text('ذخیره دسته بندی'),
                  ),
                );
              },
            ),
            const SizedBox(height: 12.0),
            //! دسته بندی
            Text(
              'دسته بندی ها',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            BlocConsumer<ExpertBloc, ExpertState>(
              listener: (context, state) {
                if (state is GetExerciseCategoryFailure) {
                  showCustomAlert(context, state.error, AlertType.error);
                }
              },
              builder: (context, state) {
                if (state is GetExerciseCategoryLoading) {
                  return AdaptiveShimmer(
                    loading: true,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('عنوان')),
                        DataColumn(label: Text('توضیحات')),
                      ],
                      rows: List<DataRow>.generate(
                        20,
                        (index) => DataRow(
                          cells: [
                            DataCell(Text('عنوان ${index + 1}')),
                            DataCell(Text('توضیحات ${index + 1}')),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (state is GetExerciseCategorySuccess) {
                  return DataTable(
                    columns: const [
                      DataColumn(label: Text('آیدی')),
                      DataColumn(label: Text('عنوان')),
                      DataColumn(label: Text('توضیحات')),
                    ],
                    rows: List<DataRow>.generate(
                      state.exerciseCategories.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text(
                              state.exerciseCategories[index].id.toString())),
                          DataCell(Text(
                              state.exerciseCategories[index].title ?? '')),
                          DataCell(Text(
                              state.exerciseCategories[index].description ??
                                  '')),
                        ],
                      ),
                    ),
                  );
                } else if (state is GetExerciseCategoryFailure) {
                  return Column(children: [
                    Text(state.error),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ExpertBloc>(context)
                            .add(GetExerciseCategory());
                      },
                      child: const Text('تلاش مجدد'),
                    ),
                  ]);
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
