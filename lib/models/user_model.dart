class UserModel {
  final String id;
  final String username;
  final String profileImageUrl;
  final String? location;

  const UserModel({
    required this.id,
    required this.username,
    required this.profileImageUrl,
    this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      location: json['location'] as String?,
    );
  }
}
