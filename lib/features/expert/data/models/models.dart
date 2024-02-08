class ExerciseCategoryRequest {
  final String title;
  final String description;

  ExerciseCategoryRequest({required this.title, required this.description});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };
}

class ExerciseCategoryModel {
  int? id;
  String? title;
  String? description;
  String? createdAt;
  int? creatorUserId;

  ExerciseCategoryModel(
      {this.id,
      this.title,
      this.description,
      this.createdAt,
      this.creatorUserId});

  ExerciseCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['createdAt'];
    creatorUserId = json['creatorUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['creatorUserId'] = creatorUserId;
    return data;
  }
}

class AddExerciseParams {
  String? title;
  String? shortDescription;
  String? longDescription;
  String? picturePath;
  int? categoryId;
  List<GuideReferencesParams>? guideReferences;

  AddExerciseParams(
      {this.title,
      this.shortDescription,
      this.longDescription,
      this.picturePath,
      this.categoryId,
      this.guideReferences});

  AddExerciseParams.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    picturePath = json['picturePath'];
    categoryId = json['categoryId'];
    if (json['guideReferences'] != null) {
      guideReferences = <GuideReferencesParams>[];
      json['guideReferences'].forEach((v) {
        guideReferences!.add(GuideReferencesParams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['shortDescription'] = shortDescription;
    data['longDescription'] = longDescription;
    data['picturePath'] = picturePath;
    data['categoryId'] = categoryId;
    if (guideReferences != null) {
      data['guideReferences'] =
          guideReferences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GuideReferencesParams {
  String? title;
  String? url;

  GuideReferencesParams({this.title, this.url});

  GuideReferencesParams.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['url'] = url;
    return data;
  }
}
