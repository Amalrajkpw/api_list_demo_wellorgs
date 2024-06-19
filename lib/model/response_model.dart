class ResponseModel {
  final int id;
  final String name;
  final String username;
  final String email;

  ResponseModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }
}