import 'models/user.dart';
import 'models/product.dart';
import 'models/company.dart';
import 'models/operation.dart';

//списочки
final List<User> usersData = [
   User(
     id: 1,
     name: 'Смехач Елена Юрьевна',
     email: 'lena.cmeh@au.com',
     password: 'admin123',
     role: 'Администратор',
     department: 'Управление',
  ),
  User(
    id: 2,
    name: 'Коробов Иван Андреевич',
    email: 'i.korobov@au.com',
    password: 'manager456',
    role: 'Сотрудник',
    department: 'Офис',
  ),
];

final List<Product> productsData = [
  Product(
    id: 1,
    name: 'Рулетка геодезическая 50м',
    category: 'ITM-037',
    price: 3200.00,
    lastUpdated: DateTime(2024, 1, 10),
  ),
  Product(
    id: 2,
    name: 'Ящик для фруктов деревянный',
    category: 'ITM-031',
    price: 220.00,
    lastUpdated: DateTime(2025, 1, 12),
  ),
  Product(
    id: 3,
    name: 'Лента "1 место"',
    category: 'ITM-042',
    price: 33.00,
    lastUpdated: DateTime(2024, 1, 5),
  ),
  Product(
    id: 4,
    name: 'Конфеты',
    category: 'ITM-048',
    price: 34.00,
    lastUpdated: DateTime(2023, 1, 15),
  ),
];

final List<Company> companiesData = [
  Company(
    id: 1,
    name: 'ООО «Золотой Ящик»',
    contactPerson: 'Васильков Д.И.',
    inn: '7701234567',
    email: 'zoloto_yashiK@au.com',
    type: 'Поставщик',
  ),
  Company(
    id: 2,
    name: 'ООО «Новое яблочко»',
    contactPerson: 'Комарова Л.С.',
    inn: '5920741836',
    email: 'new_yabloko@au.com',
    type: 'Поставщик',
  ),
  Company(
    id: 3,
    name: 'ООО «Золотое сечение»',
    contactPerson: 'Федорова Т.Р.',
    inn: '2819407365',
    email: 'secen_zoloTO@au.com',
    type: 'Поставщик',
  ),
];

final List<Operation> operationsData = [
  Operation(
    id: 1,
    type: 'IN',
    productName: 'Стеллаж сборный 5 полок',
    quantity: 10,
    user: 'Хитров В.П.',
    dateTime: DateTime(2024, 1, 10, 14, 30),
    comment: 'IN',
  ),
  Operation(
    id: 2,
    type: 'OUT',
    productName: 'Скотч упаковочный',
    quantity: 5,
    user: 'Скороход А. А.',
    dateTime: DateTime(2024, 1, 12, 11, 15),
    comment: 'OUT',
  ),
  Operation(
    id: 3,
    type: 'IN',
    productName: 'Бумага офисная А4',
    quantity: 150,
    user: 'Бегемотов В.В.',
    dateTime: DateTime(2024, 1, 15, 9, 45),
    comment: 'бумага закончилась',
  ),
];

// Функция проверки логина
User? authenticateUser(String email, String password) {
  try {
    return usersData.firstWhere(
      (user) => user.email == email && user.password == password,
    );
  } catch (e) {
    return null; // Пользователь не найден
  }
}
// Утилиты форматирования
String formatCurrency(double amount) {
  return '${amount.toStringAsFixed(2)} ₽';
}

String formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}.'
      '${date.month.toString().padLeft(2, '0')}.'
      '${date.year} '
      '${date.hour.toString().padLeft(2, '0')}:'
      '${date.minute.toString().padLeft(2, '0')}';
}