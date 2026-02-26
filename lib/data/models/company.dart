class Company {
  final int id;
  final String name;
  final String contactPerson;
  final String inn;
  final String email;
  final String type; // Поставщик или Клиент
  
  Company({
    required this.id,
    required this.name,
    required this.contactPerson,
    required this.inn,
    required this.email,
    required this.type,
  });
}