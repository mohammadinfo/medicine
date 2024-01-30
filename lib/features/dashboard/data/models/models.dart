class Plan {
  int? id;
  String? title;
  String? description;
  int? creatorUserId;
  String? startDate;
  String? endDate;
  bool? isActive;

  Plan(
      {this.id,
      this.title,
      this.description,
      this.creatorUserId,
      this.startDate,
      this.endDate,
      this.isActive});

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      creatorUserId: json['creatorUserId'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      isActive: json['isActive'],
    );
  }
}

class PlanDetail {
  int? id;
  int? planId;
  int? collectionId;
  List<int>? weekDays;

  PlanDetail({this.id, this.planId, this.collectionId, this.weekDays});

  PlanDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planId = json['planId'];
    collectionId = json['collectionId'];
    weekDays = json['weekDays'].cast<int>();
  }
}

class CollectionDetail {
  int? id;
  int? priority;
  int? exerciseId;
  int? numberPerDuration;
  int? secondsOfDuration;

  CollectionDetail(
      {this.id,
      this.priority,
      this.exerciseId,
      this.numberPerDuration,
      this.secondsOfDuration});

  CollectionDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priority = json['priority'];
    exerciseId = json['exerciseId'];
    numberPerDuration = json['numberPerDuration'];
    secondsOfDuration = json['secondsOfDuration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['priority'] = priority;
    data['exerciseId'] = exerciseId;
    data['numberPerDuration'] = numberPerDuration;
    data['secondsOfDuration'] = secondsOfDuration;
    return data;
  }
}

class ExerciseDetail {
  int? id;
  String? title;
  String? shortDescription;
  String? longDescription;
  bool? isGlobal;
  String? picturePath;
  int? categoryId;
  List<GuideReferences>? guideReferences;

  ExerciseDetail(
      {this.id,
      this.title,
      this.shortDescription,
      this.longDescription,
      this.isGlobal,
      this.picturePath,
      this.categoryId,
      this.guideReferences});

  ExerciseDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    isGlobal = json['isGlobal'];
    picturePath = json['picturePath'];
    categoryId = json['categoryId'];
    if (json['guideReferences'] != null) {
      guideReferences = <GuideReferences>[];
      json['guideReferences'].forEach((v) {
        guideReferences!.add(GuideReferences.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['shortDescription'] = shortDescription;
    data['longDescription'] = longDescription;
    data['isGlobal'] = isGlobal;
    data['picturePath'] = picturePath;
    data['categoryId'] = categoryId;
    if (guideReferences != null) {
      data['guideReferences'] =
          guideReferences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GuideReferences {
  String? title;
  String? url;

  GuideReferences({this.title, this.url});

  GuideReferences.fromJson(Map<String, dynamic> json) {
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
