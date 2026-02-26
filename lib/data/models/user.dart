class User {
  final int id;
  final String name;
  final String email;
  final String password; 
  final String role;
  final String department;
  final String? phone;
  
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.department,
    this.phone,
  });
}