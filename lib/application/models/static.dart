class StaticModel {
  StaticModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  StaticModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
