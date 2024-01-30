abstract class ClientEvent {}

class FetchCollectionDetailById extends ClientEvent {
  final int collectionId;

  FetchCollectionDetailById(this.collectionId);
}

class FetchPlanById extends ClientEvent {
  final int id;
  FetchPlanById(this.id);
}

class FetchAllPlans extends ClientEvent {}

class FetchPlanDetailsById extends ClientEvent {
  final int planId;
  FetchPlanDetailsById(this.planId);
}

class FetchExerciseDetailById extends ClientEvent {
  final int exerciseId;
  FetchExerciseDetailById(this.exerciseId);
}
