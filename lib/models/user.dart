/// User model class for authentication
class UserModel {
  final String email;
  final String? name;

  UserModel({required this.email, this.name});

  /// Convert UserModel to JSON for storage
  Map<String, dynamic> toJson() {
    return {'email': email, 'name': name};
  }

  /// Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      name: json['name'] as String?,
    );
  }
}
