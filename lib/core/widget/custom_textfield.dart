import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.isPassword,
    this.iconData,
    this.validator,
  });

  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final IconData? iconData;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _togglePass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2.w),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(color: AppColors.primary),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: widget.isPassword
            ? InkWell(
          onTap: _togglePass,
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.primary,
          ),
        )
            : Icon(widget.iconData, color: AppColors.primary),
      ),
    );
  }
}
