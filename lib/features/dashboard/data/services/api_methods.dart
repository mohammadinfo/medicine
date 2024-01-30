import 'package:dio/dio.dart';
import 'package:medicine/core/api_client.dart';
import 'package:medicine/features/dashboard/data/models/models.dart';

class ApiClient {
  Future<Plan> getPlanById(int id) async {
    Response response = await dio.get('client/Plan/$id');
    return Plan.fromJson(response.data);
  }

  Future<List<Plan>> getAllPlans() async {
    Response response = await dio.get('client/Plan');
    return (response.data as List).map((i) => Plan.fromJson(i)).toList();
  }

  Future<List<PlanDetail>> getPlanDetailsById(int planId) async {
    Response response = await dio.get('client/plan-detail/$planId');
    return (response.data as List).map((i) => PlanDetail.fromJson(i)).toList();
  }

  Future<List<CollectionDetail>> getCollectionDetailById(
      int collectionId) async {
    Response response = await dio.get('client/collection-detail/$collectionId');
    return (response.data as List)
        .map((i) => CollectionDetail.fromJson(i))
        .toList();
  }

  Future<ExerciseDetail> getExerciseDetailsById(int exerciseId) async {
    Response response = await dio.get('expert/Exercise/$exerciseId');
    return ExerciseDetail.fromJson(response.data);
  }
}
