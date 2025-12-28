import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
              Text(
                'Hesabım',
                style: GoogleFonts.inter(
                  textStyle: kTitleStyle,
                ),
              ),
              const SizedBox(height: 32),

              // Profile Section
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kInputBackgroundColor,
                        border: Border.all(color: kPrimaryColorBegin, width: 2),
                      ),
                      child: const Icon(Icons.person, size: 60, color: kTextColor),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Kullanıcı Adı',
                      style: GoogleFonts.inter(
                        color: kTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'kullanici@email.com',
                      style: GoogleFonts.inter(
                        color: kHintColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // Menu Items
              _buildMenuItem(
                'Ayarlar',
                Icons.settings,
                () {},
              ),
              _buildMenuItem(
                'Kategoriler',
                Icons.category,
                () {},
              ),
              _buildMenuItem(
                'Hesaplar',
                Icons.account_balance,
                () {},
              ),
              _buildMenuItem(
                'Yardım',
                Icons.help_outline,
                () {},
              ),
              const SizedBox(height: 24),
              _buildMenuItem(
                'Çıkış Yap',
                Icons.logout,
                () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                },
                isDestructive: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap, {bool isDestructive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: kInputBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDestructive ? kRedColor.withOpacity(0.1) : kPrimaryColorBegin.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isDestructive ? kRedColor : kPrimaryColorBegin,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.inter(
            color: isDestructive ? kRedColor : kTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: kHintColor),
      ),
    );
  }
}
