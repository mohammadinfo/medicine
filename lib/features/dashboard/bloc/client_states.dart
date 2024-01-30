import 'package:medicine/features/dashboard/data/models/models.dart';

abstract class ClientState {}

class ClientInitial extends ClientState {}

//
class PlanLoading extends ClientState {}

class PlanSuccess extends ClientState {
  final Plan plan;

  PlanSuccess(this.plan);
}

class PlanError extends ClientState {
  final String message;

  PlanError(this.message);
}

//
class AllPlansLoading extends ClientState {}

class AllPlansSuccess extends ClientState {
  final List<Plan> plans;

  AllPlansSuccess(this.plans);
}

class AllPlansError extends ClientState {
  final String message;

  AllPlansError(this.message);
}

//
class PlanDetailsLoading extends ClientState {}

class PlanDetailsSuccess extends ClientState {
  final List<PlanDetail> planDetails;
  PlanDetailsSuccess(this.planDetails);
}

class PlanDetailsError extends ClientState {
  final String message;

  PlanDetailsError(this.message);
}

//
class CollectionDetailLoading extends ClientState {}

class CollectionDetailSuccess extends ClientState {
  List<CollectionDetail> collections;

  CollectionDetailSuccess(this.collections);
}

class CollectionDetailError extends ClientState {
  final String message;

  CollectionDetailError(this.message);
}

//
class ExerciseDetailLoading extends ClientState {}

class ExerciseDetailSuccess extends ClientState {
  ExerciseDetail exerciseDetail;

  ExerciseDetailSuccess(this.exerciseDetail);
}

class ExerciseDetailError extends ClientState {
  final String message;

  ExerciseDetailError(this.message);
}
//