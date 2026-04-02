class EditProfileModel {
  final String? message;
  final EditProfileData? data;

  const EditProfileModel({this.message, this.data});

  factory EditProfileModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const EditProfileModel();
    return EditProfileModel(
      message: json['message'] as String?,
      data: EditProfileData.fromJson(json['data'] as Map<String, dynamic>?),
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};
}

class EditProfileData {
  final EditProfileUser? user;

  const EditProfileData({this.user});

  factory EditProfileData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const EditProfileData();
    return EditProfileData(
      user: EditProfileUser.fromJson(json['user'] as Map<String, dynamic>?),
    );
  }

  Map<String, dynamic> toJson() => {'user': user?.toJson()};
}

class EditProfileUser {
  final int? id;
  final String? name;
  final String? email;
  final String? createdAt;
  final String? updatedAt;

  const EditProfileUser({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory EditProfileUser.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const EditProfileUser();
    return EditProfileUser(
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
