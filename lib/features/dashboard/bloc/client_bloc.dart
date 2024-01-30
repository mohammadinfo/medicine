import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine/features/dashboard/bloc/client_events.dart';
import 'package:medicine/features/dashboard/bloc/client_states.dart';
import 'package:medicine/features/dashboard/data/services/api_methods.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ApiClient apiClient;
  //
  ClientBloc(this.apiClient) : super(ClientInitial()) {
    on<FetchPlanById>((event, emit) async {
      emit(PlanLoading());
      try {
        final plan = await apiClient.getPlanById(event.id);
        emit(PlanSuccess(plan));
      } catch (e) {
        emit(PlanError(e.toString()));
      }
    });
    //
    on<FetchAllPlans>((event, emit) async {
      emit(AllPlansLoading());
      try {
        final plans = await apiClient.getAllPlans();
        emit(AllPlansSuccess(plans));
      } catch (e) {
        emit(AllPlansError(e.toString()));
      }
    });
    //
    on<FetchPlanDetailsById>((event, emit) async {
      emit(PlanDetailsLoading());
      try {
        final planDetails = await apiClient.getPlanDetailsById(event.planId);
        emit(PlanDetailsSuccess(planDetails));
      } catch (e) {
        emit(PlanDetailsError(e.toString()));
      }
    });
    //
    on<FetchCollectionDetailById>((event, emit) async {
      emit(CollectionDetailLoading());
      try {
        final collections =
            await apiClient.getCollectionDetailById(event.collectionId);
        emit(CollectionDetailSuccess(collections));
      } catch (e) {
        emit(CollectionDetailError(e.toString()));
      }
    });
    //
    on<FetchExerciseDetailById>((event, emit) async {
      emit(ExerciseDetailLoading());
      try {
        final exerciseDetail =
            await apiClient.getExerciseDetailsById(event.exerciseId);
        emit(ExerciseDetailSuccess(exerciseDetail));
      } catch (e) {
        emit(ExerciseDetailError(e.toString()));
      }
    });
  }
}
