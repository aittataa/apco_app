import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String hint;
  final TextInputType? keyboardType;
  final IconData icon;
  final Widget? suffixIcon;
  final dynamic onChanged;

  const TextBox({
    this.controller,
    this.obscureText = false,
    required this.hint,
    this.keyboardType,
    required this.icon,
    this.suffixIcon,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: TextInputAction.next,
          cursorColor: AppTheme.mainColor,
          style: TextStyle(
            color: AppTheme.blackTextColor.withOpacity(.75),
            fontWeight: FontWeight.bold,
          ),
          obscureText: obscureText,
          obscuringCharacter: "●",
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            prefixIcon: Icon(icon, color: AppTheme.lightMainColor),
            suffixIcon: suffixIcon,
            hintText: "$hint",
            hintStyle: TextStyle(
              color: AppTheme.blackTextColor.withOpacity(.5),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1.5, color: AppTheme.lightMainColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 2.5, color: AppTheme.lightMainColor),
            ),
          ),
        ),
      ),
    );
  }
}