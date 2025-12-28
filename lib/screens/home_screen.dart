import 'package:flutter/material.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Merhaba, Ahmet 👋', style: kButtonTextStyle),
                          Text('Hoşgeldin', style: kSubtitleStyle),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kInputBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.notifications_outlined, color: Colors.white),
                      onPressed: () {},
                    ),
                  )
                ],
              ),

              SizedBox(height: 30),

              // Balance Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kPrimaryColorBegin, kPrimaryColorEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Text('Toplam Bakiye', style: TextStyle(color: Colors.white70, fontFamily: 'Inter')),
                    SizedBox(height: 8),
                    Text(
                      '₺24.500,00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildIncomeExpenseItem(
                          icon: Icons.arrow_downward,
                          label: 'Gelir',
                          amount: '₺32.000',
                          color: kGreenColor,
                        ),
                        Container(height: 40, width: 1, color: Colors.white24),
                        _buildIncomeExpenseItem(
                          icon: Icons.arrow_upward,
                          label: 'Gider',
                          amount: '₺7.500',
                          color: kRedColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Recent Transactions Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Son İşlemler', style: kTitleStyle.copyWith(fontSize: 20)),
                  TextButton(
                    onPressed: () {},
                    child: Text('Tümü', style: TextStyle(color: kPrimaryColorBegin)),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // Transactions List (Mock)
              _buildTransactionItem(
                icon: Icons.shopping_bag,
                title: 'Market Alışverişi',
                subtitle: 'Bugün, 14:30',
                amount: '-₺450,00',
                isExpense: true,
              ),
              _buildTransactionItem(
                icon: Icons.work,
                title: 'Maaş Ödemesi',
                subtitle: 'Dün, 09:00',
                amount: '+₺32.000,00',
                isExpense: false,
              ),
              _buildTransactionItem(
                icon: Icons.coffee,
                title: 'Starbucks',
                subtitle: 'Dün, 08:30',
                amount: '-₺85,00',
                isExpense: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIncomeExpenseItem({
    required IconData icon,
    required String label,
    required String amount,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 16),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
            Text(amount, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required bool isExpense,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kInputBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: kPrimaryColorBegin),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: kButtonTextStyle),
                SizedBox(height: 4),
                Text(subtitle, style: kSubtitleStyle),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: isExpense ? kRedColor : kGreenColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
