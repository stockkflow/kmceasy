import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              // Logo
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kPrimaryColorBegin,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColorBegin.withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(height: 20),
              Text('EasyBudget', style: kTitleStyle),
              SizedBox(height: 8),
              Text('Finansal özgürlüğünüze adım atın', style: kSubtitleStyle),

              SizedBox(height: 50),
              Text('Giriş Yap', style: kTitleStyle.copyWith(fontSize: 24)),

              SizedBox(height: 30),
              CustomTextField(
                label: 'E-posta veya Kullanıcı Adı',
                hintText: 'kullanici@ornek.com',
                icon: Icons.person,
              ),

              SizedBox(height: 20),
              CustomTextField(
                label: 'Şifre',
                hintText: '••••••••',
                icon: Icons.lock,
                isPassword: true,
                suffixIcon: Icon(Icons.visibility, color: Colors.white54),
              ),

              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Şifremi Unuttum?',
                    style: TextStyle(color: kPrimaryColorBegin),
                  ),
                ),
              ),

              SizedBox(height: 20),
              PrimaryButton(
                text: 'Giriş Yap',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
              ),

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: kInputBackgroundColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.face, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Face ID ile Giriş', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.white10)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('veya', style: TextStyle(color: kHintColor)),
                  ),
                  Expanded(child: Divider(color: Colors.white10)),
                ],
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(icon: Icons.apple, onPressed: () {}),
                  SizedBox(width: 20),
                  SocialButton(icon: Icons.language, onPressed: () {}),
                ],
              ),

              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hesabınız yok mu? ', style: TextStyle(color: kHintColor)),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        color: kPrimaryColorBegin,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
