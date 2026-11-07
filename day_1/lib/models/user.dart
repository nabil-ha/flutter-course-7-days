enum UserRole { Partner, Client, Operation, Admin }

class User {
  String name;
  String email;
  String? department;
  UserRole role;
  User({
    required this.name,
    required this.email,
    required this.role,
    this.department,
  });
}
