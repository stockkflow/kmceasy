import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int touchedIndex = -1;

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
                  Text(
                    'İstatistikler',
                    style: GoogleFonts.inter(
                      textStyle: kTitleStyle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: kInputBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Ekim 2023',
                          style: GoogleFonts.inter(
                            color: kTextColor,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.keyboard_arrow_down, color: kTextColor, size: 18),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Total Spending
              Text(
                'TOPLAM HARCAMA',
                style: GoogleFonts.inter(
                  color: kHintColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '₺2.450',
                style: GoogleFonts.inter(
                  color: kTextColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),

              // Bar Chart
              SizedBox(
                height: 250,
                child: BarChart(
                  BarChartData(
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (_) => kInputBackgroundColor,
                        tooltipMargin: 8,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            rod.toY.round().toString(),
                            const TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      touchCallback: (FlTouchEvent event, barTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              barTouchResponse == null ||
                              barTouchResponse.spot == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                        });
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            const style = TextStyle(
                              color: kHintColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            Widget text;
                            switch (value.toInt()) {
                              case 0:
                                text = const Text('01', style: style);
                                break;
                              case 1:
                                text = const Text('05', style: style);
                                break;
                              case 2:
                                text = const Text('10', style: style);
                                break;
                              case 3:
                                text = const Text('15', style: style);
                                break;
                              case 4:
                                text = const Text('20', style: style);
                                break;
                              case 5:
                                text = const Text('25', style: style);
                                break;
                              default:
                                text = const Text('', style: style);
                                break;
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              space: 16,
                              child: text,
                            );
                          },
                          reservedSize: 38,
                        ),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: [
                      makeGroupData(0, 500),
                      makeGroupData(1, 1200),
                      makeGroupData(2, 850),
                      makeGroupData(3, 400),
                      makeGroupData(4, 950),
                      makeGroupData(5, 600),
                    ],
                    gridData: const FlGridData(show: false),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Categories List
              _buildCategoryItem(
                'Alışveriş',
                '₺1.200',
                Icons.shopping_cart_outlined,
                const Color(0xFFEAB308), // Yellowish
              ),
              _buildCategoryItem(
                'Yemek',
                '₺850',
                Icons.restaurant_menu,
                const Color(0xFFF97316), // Orange
              ),
              _buildCategoryItem(
                'Ulaşım',
                '₺350',
                Icons.directions_car,
                const Color(0xFFEF4444), // Red
              ),
              _buildCategoryItem(
                'Faturalar',
                '₺50',
                Icons.receipt_long,
                const Color(0xFF3B82F6), // Blue
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: x == touchedIndex ? kPrimaryColorBegin : kInputBackgroundColor,
          width: 22,
          borderRadius: BorderRadius.circular(4),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 1500, // Max height
            color: Colors.transparent, // Transparent background for bar
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String title, String amount, IconData icon, Color iconColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kInputBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
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
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.inter(
              color: kTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
