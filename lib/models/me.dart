class Me {
  static Me defaultUser = Me(
      id: "", email: "", name: "User", dob: DateTime(2000), profileImage: "");

  final String id;
  final String email;
  final String name;
  final String profileImage;
  final DateTime? dob;

  Me({
    required this.id,
    required this.email,
    required this.dob,
    required this.name,
    required this.profileImage,
  });

  factory Me.fromMap(var data) {
    final Map map = data as Map;
    return Me(
      id: map['id']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      dob: DateTime.tryParse('${map['dob']}'),
      name: map['name']?.toString() ?? 'anonymous',
      profileImage: "${map['photo'] ?? ""}",
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'email': email,
        'dob': dob,
        'name': name,
        'photo': profileImage,
      };
}
