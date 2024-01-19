class ReviewModel {
  String? id;
  String? name;
  String? profileImage;
  String? description;
  String? reviewerId;

  ReviewModel({
    required this.name,
    required this.profileImage,
    required this.description,
    required this.reviewerId,
    required this.id,
  });

  ReviewModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    profileImage = json['profilePicture'];
    description = json['description'];
    reviewerId = json['reviewerId'];
    id = json['id'];
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'profileImage': profileImage,
        'description': description,
        'reviewerId': reviewerId,
        'id': id,
      };
}
