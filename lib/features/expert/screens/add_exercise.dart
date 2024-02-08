// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine/core/snackbar.dart';
import 'package:medicine/features/expert/bloc/expert_bloc.dart';
import 'package:medicine/features/expert/data/models/models.dart';

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({super.key});

  @override
  _AddExerciseScreenState createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final shortDescriptionController = TextEditingController();
  final longDescriptionController = TextEditingController();
  final picturePathController = TextEditingController();
  int selectedExerciseCategoryId = 0;
  List<Map<String, TextEditingController>> guideReferences = [];

  void addGuideReference() {
    setState(() {
      guideReferences.add({
        'title': TextEditingController(),
        'url': TextEditingController(),
      });
    });
  }

  @override
  void initState() {
    BlocProvider.of<ExpertBloc>(context).add(GetExerciseCategory());
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    shortDescriptionController.dispose();
    longDescriptionController.dispose();
    picturePathController.dispose();
    for (var map in guideReferences) {
      map['title']!.dispose();
      map['url']!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('افزودن تمرین'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'عنوان'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفا یک عنوان وارد کنید';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: shortDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'توضیح کوتاه',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفا یک توضیح کوتاه وارد کنید';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: longDescriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'توضیح بلند',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفا یک توضیح بلند وارد کنید';
                  }
                  return null;
                },
              ),
              BlocConsumer<ExpertBloc, ExpertState>(
                listener: (context, state) {
                  if (state is GetExerciseCategoryFailure) {
                    showCustomAlert(context, state.error, AlertType.error);
                  }
                },
                builder: (context, state) {
                  if (state is GetExerciseCategoryLoading) {
                    return const CupertinoActivityIndicator();
                  } else if (state is GetExerciseCategorySuccess) {
                    return DropdownButtonFormField(
                      hint: const Text('دسته بندی تمرین'),
                      items: state.exerciseCategories
                          .map(
                            (e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(e.title ?? ''),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        selectedExerciseCategoryId = value ?? 0;
                      },
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
              ...guideReferences.map((map) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: map['title']!,
                        decoration: const InputDecoration(labelText: 'عنوان'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: map['url']!,
                        decoration: const InputDecoration(labelText: 'لینک'),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      onPressed: () {
                        setState(() {
                          guideReferences.remove(map);
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                );
              }).toList(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: addGuideReference,
                child: const Text('افزودن راهنما'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BlocConsumer<ExpertBloc, ExpertState>(
                  buildWhen: (previous, current) {
                    if (current is AddExerciseSuccess ||
                        current is AddExerciseFailure ||
                        current is AddExerciseLoading) {
                      return true;
                    }
                    return false;
                  },
                  listenWhen: (previous, current) {
                    if (current is AddExerciseSuccess ||
                        current is AddExerciseFailure) {
                      return true;
                    }
                    return false;
                  },
                  listener: (context, state) {
                    if (state is AddExerciseSuccess) {
                      showCustomAlert(
                        context,
                        'تمرین با موفقیت ثبت شد',
                        AlertType.success,
                      );
                    }
                    if (state is AddExerciseFailure) {
                      showCustomAlert(context, state.error, AlertType.error);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is AddExerciseLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<ExpertBloc>(context).add(
                                  AddExercise(
                                    AddExerciseParams(
                                      title: titleController.text,
                                      shortDescription:
                                          shortDescriptionController.text,
                                      longDescription:
                                          longDescriptionController.text,
                                      categoryId: selectedExerciseCategoryId,
                                      picturePath: 'www.google.com',
                                      guideReferences: guideReferences
                                          .map((e) => GuideReferencesParams(
                                                title: e['title']?.text,
                                                url: e['url']?.text,
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                );
                              }
                            },
                      child: const Text('ثبت تمرین'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
