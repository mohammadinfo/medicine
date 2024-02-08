import 'package:medicine/core/api_client.dart';
import 'package:medicine/features/expert/data/models/models.dart';

class ExpertApiClient {
  //
  Future<bool> createExerciseCategory(ExerciseCategoryRequest request) async {
    try {
      final response = await dio.post(
        'admin/exercise-category',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to create exercise category');
      }
    } catch (e) {
      throw Exception('Failed to create exercise category: $e');
    }
  }

  //
  Future<List<ExerciseCategoryModel>> getExerciseCategory() async {
    try {
      final response = await dio.get('admin/exercise-category');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (response.data as List)
            .map((i) => ExerciseCategoryModel.fromJson(i))
            .toList();
      }
      throw Exception('Failed to get exercise category');
    } catch (e) {
      throw Exception('Failed to get exercise category: $e');
    }
  }

  //
  Future<bool> addExercise(AddExerciseParams params) async {
    try {
      final response = await dio.post('expert/Exercise', data: params.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to add exercise');
      }
    } catch (e) {
      throw Exception('Failed to add exercise: $e');
    }
  }
}
