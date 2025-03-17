class User {
  final String id;
  final String name;
  final String email;
  final String occupation;
  final String bio;
  final int? v;
  final String avatar;  
  final String username; 
  final String gender;   

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.occupation,
    required this.bio,
    this.v,
    required this.avatar,
    required this.username,
    required this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      occupation: json['occupation'] ?? 'Unknown',
      bio: json['bio'] ?? '',
      v: json['__v'] as int?,
      avatar: json['avatar'] ?? '',  // Parsing avatar
      username: json['username'] ?? 'N/A',  // Parsing username
      gender: json['gender'] ?? 'N/A',  // Parsing gender
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'occupation': occupation,
      'bio': bio,
      '__v': v,
      'avatar': avatar, 
      'username': username,
      'gender': gender,
    };
  }
}
