import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.suffixIcon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: kHintColor, fontSize: 14),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: kInputBackgroundColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white10),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            style: TextStyle(color: kTextColor),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white24),
              prefixIcon: Icon(icon, color: Colors.white54),
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ),
        ),
      ],
    );
  }
}
