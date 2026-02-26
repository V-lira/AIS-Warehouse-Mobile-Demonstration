import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/mock_data.dart';
import 'package:flutter_application_1/data/models/user.dart';
import 'package:flutter_application_1/screens/auth/login_screen.dart';
import 'main_tabs/products_screen.dart';
import 'main_tabs/companies_screen.dart';
import 'main_tabs/operations_screen.dart';
import 'main_tabs/profile_screen.dart';
import 'package:flutter_application_1/data/models/product.dart';

class MainAppScreen extends StatefulWidget {
  final User user;
  
  const MainAppScreen({super.key, required this.user});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const ProductsScreen(),
      const CompaniesScreen(),
      const OperationsScreen(),
      ProfileScreen(user: widget.user),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  // Создаем виджет статистики
  Widget _buildStatsCard() {
    // Подсчитываем общую стоимость товаров
    double totalValue = 0;
    for (var product in productsData) {
      totalValue += product.price;
    }
    
    // Самый дорогой товар
    final mostExpensive = productsData.isNotEmpty 
        ? productsData.reduce((a, b) => a.price > b.price ? a : b)
        : null;

    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Заголовок статистики
            const Row(
              children: [
                Icon(Icons.analytics, size: 18, color: Color(0xFF757527)),
                SizedBox(width: 8),
                Text(
                  'Общая статистика',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF757527),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Основная статистика
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  Icons.inventory,
                  'Товары',
                  '${productsData.length}',
                  Colors.blue,
                ),
                _buildStatItem(
                  Icons.business,
                  'Компании',
                  '${companiesData.length}',
                  Colors.green,
                ),
                _buildStatItem(
                  Icons.history,
                  'Операции',
                  '${operationsData.length}',
                  Colors.orange,
                ),
                _buildStatItem(
                  Icons.people,
                  'Сотрудники',
                  '${usersData.length}',
                  Colors.purple,
                ),
              ],
            ),
            
            // Дополнительная статистика (только на экране товаров)
            if (_selectedIndex == 0 && productsData.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 12),
              _buildFinancialStats(totalValue, mostExpensive!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF757527),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildFinancialStats(double totalValue, Product mostExpensive) {
    // Количество товаров по категориям
    
    return Column(
      children: [
        // Финансовая информация
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  formatCurrency(totalValue),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const Text(
                  'Общая стоимость',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  formatCurrency(mostExpensive.price),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const Text(
                  'Самый дорогой',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  formatCurrency(totalValue / productsData.length),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const Text(
                  'Средняя цена',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
        
        // Статистика по категориям
        const SizedBox(height: 12),
        const Divider(height: 1),
        const SizedBox(height: 8),
        
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
        ),
      ],
    );
  }

  Widget _buildCategoryStat(String category, int count, Color color) {
    return Column(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$count',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          category,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_getAppBarTitle()),
            // Статус пользователя в заголовке
            Text(
              widget.user.role,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: _logout,
            tooltip: 'Выйти',
          ),
        ],
      ),
      body: Column(
        children: [
          // Показываем статистику на всех экранах кроме профиля
          if (_selectedIndex != 3) _buildStatsCard(),
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF757527),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Товары',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Компании',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Операции',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }

  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0: return 'Товары на складе';
      case 1: return 'Компании';
      case 2: return 'Журнал операций';
      case 3: return 'Мой профиль';
      default: return 'AIS Warehouse';
    }
  }
}