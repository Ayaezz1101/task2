import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/theme/themeData.dart'; 
class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData suffixIcon;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    this.isPassword = false,
  });

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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppTheme.fieldGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14.sp, color: const Color(0x80000000)),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          border: InputBorder.none,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: const Color(0xFF252525),
                    size: 24.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : Icon(widget.suffixIcon, color: const Color(0xFF252525), size: 24.sp),
        ),
      ),
    );
  }
}