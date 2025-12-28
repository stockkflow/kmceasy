import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TOPLAM BAKİYE',
                        style: GoogleFonts.inter(
                          color: kHintColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '₺48.250',
                        style: GoogleFonts.inter(
                          color: kTextColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kInputBackgroundColor,
                      border: Border.all(color: Colors.white10),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColorBegin.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.add, color: kTextColor),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Title and Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bütçelerim',
                    style: GoogleFonts.inter(
                      textStyle: kTitleStyle,
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: kInputBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Ekim 2023',
                      style: GoogleFonts.inter(
                        color: kTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Summary Cards
              Row(
                children: [
                  Expanded(
                    child: _buildSummaryCard(
                      'LİMİT',
                      '₺25.000',
                      Icons.account_balance_wallet_outlined,
                      const Color(0xFF3B82F6),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSummaryCard(
                      'HARCANAN',
                      '₺14.200',
                      Icons.trending_down,
                      const Color(0xFFF87171),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Budget List
              _buildBudgetItem(
                'Ev Kirası',
                '₺10.000',
                '₺10.000 Limit',
                1.0,
                '100%',
                'Tamamlandı',
                Icons.home,
                const Color(0xFF3B82F6),
                isCompleted: true,
              ),
              _buildBudgetItem(
                'Market & Mutfak',
                '₺3.500',
                '₺5.000 Limit',
                0.7,
                '70%',
                'Kalan: ₺1.500',
                Icons.shopping_cart,
                const Color(0xFFF97316),
              ),
              _buildBudgetItem(
                'Eğlence',
                '₺400',
                '₺2.000 Limit',
                0.2,
                '20%',
                'Kalan: ₺1.600',
                Icons.celebration,
                const Color(0xFFEC4899), // Pink
              ),
              _buildBudgetItem(
                'Ulaşım',
                '₺950',
                '₺1.000 Limit',
                0.95,
                '95%',
                'Uyarı!',
                Icons.directions_car,
                const Color(0xFFEF4444),
                isWarning: true,
              ),
              // Extra space for bottom nav
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
      String title, String amount, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kInputBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.inter(
                  color: kHintColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            amount,
            style: GoogleFonts.inter(
              color: kTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetItem(
    String title,
    String spent,
    String limitText,
    double progress,
    String percentage,
    String statusText,
    IconData icon,
    Color color, {
    bool isCompleted = false,
    bool isWarning = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kInputBackgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        color: kTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      limitText,
                      style: GoogleFonts.inter(
                        color: kHintColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    spent,
                    style: GoogleFonts.inter(
                      color: kTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    statusText,
                    style: GoogleFonts.inter(
                      color: isCompleted
                          ? const Color(0xFF3B82F6)
                          : isWarning
                              ? const Color(0xFFEF4444)
                              : const Color(0xFFF97316),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.black12,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 8,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                percentage,
                style: GoogleFonts.inter(
                  color: kTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
