part of 'expert_bloc.dart';

@immutable
sealed class ExpertState {}

final class ExpertInitial extends ExpertState {}

//
class ExerciseCategoryLoading extends ExpertState {}

class ExerciseCategorySuccess extends ExpertState {
  ExerciseCategorySuccess();
}

class ExerciseCategoryFailure extends ExpertState {
  final String error;

  ExerciseCategoryFailure(this.error);
}

//
class GetExerciseCategoryLoading extends ExpertState {}

class GetExerciseCategorySuccess extends ExpertState {
  final List<ExerciseCategoryModel> exerciseCategories;
  GetExerciseCategorySuccess(this.exerciseCategories);
}

class GetExerciseCategoryFailure extends ExpertState {
  final String error;
  GetExerciseCategoryFailure(this.error);
}

//
class AddExerciseLoading extends ExpertState {}

class AddExerciseSuccess extends ExpertState {}

class AddExerciseFailure extends ExpertState {
  final String error;
  AddExerciseFailure(this.error);
}
//