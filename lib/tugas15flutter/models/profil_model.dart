class ProfileModel {
  final String? message;
  final ProfileUser? data;

  const ProfileModel({this.message, this.data});

  factory ProfileModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const ProfileModel();
    return ProfileModel(
      message: json['message'] as String?,
      data: ProfileUser.fromJson(json['data'] as Map<String, dynamic>?),
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};
}

class ProfileUser {
  final int? id;
  final String? name;
  final String? email;
  final String? createdAt;
  final String? updatedAt;

  const ProfileUser({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileUser.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const ProfileUser();
    return ProfileUser(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
