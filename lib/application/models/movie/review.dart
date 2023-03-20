class ReviewData {
  ReviewData({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  String? author;
  AuthorDetails? authorDetails;
  String? content;
  String? createdAt;
  String? id;
  String? updatedAt;
  String? url;

  ReviewData.fromJson(Map<String, dynamic> json) {
    author = json["author"];
    authorDetails = AuthorDetails?.fromJson(json["author_details"]);
    content = json["content"];
    createdAt = json["created_at"];
    id = json["id"];
    updatedAt = json["updated_at"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["author"] = author;
    data["author_details"] = authorDetails?.toJson();
    data["content"] = content;
    data["created_at"] = createdAt;
    data["id"] = id;
    data["updated_at"] = updatedAt;
    data["url"] = url;
    return data;
  }
}

class AuthorDetails {
  AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  String? name;
  String? username;
  String? avatarPath;
  double? rating;

  AuthorDetails.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    username = json["username"];
    avatarPath = json["avatar_path"];
    rating = json["rating"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["name"] = name;
    data["username"] = username;
    data["avatar_path"] = avatarPath;
    data["rating"] = rating;
    return data;
  }
}
