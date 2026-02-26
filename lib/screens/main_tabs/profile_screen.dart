import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Аватар
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFD0D09E),
                borderRadius: BorderRadius.circular(60),
              ),
              child: const Icon(
                Icons.person,
                size: 60,
                color: Color(0xFF757527),
              ),
            ),
            
            // Имя
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF757527),
              ),
              textAlign: TextAlign.center,
            ),
            
            // Должность
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 32),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFD0D09E).withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                user.role,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF757527),
                ),
              ),
            ),
            
            // Информационная карточка
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildInfoRow(Icons.email, 'Email', user.email),
                    const Divider(),
                    _buildInfoRow(Icons.business, 'Отдел', user.department),
                    const Divider(),
                    if (user.phone != null) ...[
                      _buildInfoRow(Icons.phone, 'Телефон', user.phone!),
                      const Divider(),
                    ],
                    _buildInfoRow(Icons.badge, 'ID сотрудника', user.id.toString()),
                  ],
                ),
              ),
            ),
            
            // Статистика (заглушка)
            const SizedBox(height: 32),
            const Text(
              'Статистика за месяц',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF757527),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard('15', 'Операций'),
                _buildStatCard('8', 'Приходов'),
                _buildStatCard('7', 'Расходов'),
              ],
            ),
            
            // Кнопка выхода
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD0D09E),
                  foregroundColor: const Color(0xFF757527),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                icon: const Icon(Icons.exit_to_app),
                label: const Text('Выйти'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFB1B163)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFD0D09E),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF757527),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}