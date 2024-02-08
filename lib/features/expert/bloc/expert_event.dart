part of 'expert_bloc.dart';

@immutable
sealed class ExpertEvent {}

class ExerciseCategoryCreate extends ExpertEvent {
  final ExerciseCategoryRequest request;

  ExerciseCategoryCreate(this.request);
}

class GetExerciseCategory extends ExpertEvent {}

class AddExercise extends ExpertEvent {
  final AddExerciseParams params;
  AddExercise(this.params);
}
