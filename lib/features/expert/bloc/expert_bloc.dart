// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:medicine/features/expert/data/models/models.dart';
import 'package:medicine/features/expert/data/services/api_methods.dart';
import 'package:meta/meta.dart';
part 'expert_event.dart';
part 'expert_state.dart';

class ExpertBloc extends Bloc<ExpertEvent, ExpertState> {
  ExpertApiClient expertApiClient;
  ExpertBloc(this.expertApiClient) : super(ExpertInitial()) {
    //
    on<ExerciseCategoryCreate>((event, emit) async {
      emit(ExerciseCategoryLoading());
      try {
        await expertApiClient.createExerciseCategory(event.request);
        emit(ExerciseCategorySuccess());
      } catch (error) {
        emit(ExerciseCategoryFailure(error.toString()));
      }
    });
    //
    on<GetExerciseCategory>((event, emit) async {
      emit(GetExerciseCategoryLoading());
      try {
        var response = await expertApiClient.getExerciseCategory();
        emit(GetExerciseCategorySuccess(response));
      } catch (error) {
        emit(GetExerciseCategoryFailure(error.toString()));
      }
    });
    //
    on<AddExercise>((event, emit) async {
      emit(AddExerciseLoading());
      try {
        await expertApiClient.addExercise(event.params);
        emit(AddExerciseSuccess());
      } catch (error) {
        emit(AddExerciseFailure(error.toString()));
      }
    });
  }
}
