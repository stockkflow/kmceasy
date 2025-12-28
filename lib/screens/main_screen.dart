import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'stats_screen.dart';
import 'budget_screen.dart';
import 'account_screen.dart';
import 'add_transaction_screen.dart';
import '../constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const StatsScreen(),
    const BudgetScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white10)),
        ),
        child: BottomNavigationBar(
          backgroundColor: kBackgroundColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: kPrimaryColorBegin,
          unselectedItemColor: Colors.white38,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Ana Sayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'İstatistik',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              activeIcon: Icon(Icons.account_balance_wallet),
              label: 'Bütçe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Hesap',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddTransactionScreen()),
          );
        },
        backgroundColor: kPrimaryColorBegin,
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
