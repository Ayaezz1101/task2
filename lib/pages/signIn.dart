import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/pages/signUp.dart';
import 'package:task2/pages/verify.dart';
import 'package:task2/srvices/pageTransition.dart';
import 'package:task2/theme/themeData.dart';
import 'package:task2/wigets/brimaryButton.dart';
import 'package:task2/wigets/textField.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 390.w,
          height: 844.h, // لضمان ثبات العناصر في الـ Stack
          child: Stack(
            children: [
              // 1. الصورة العلوية
              Positioned(
                top: 46.h, left: 74.w,
                child: Image.asset('assets/images/undraw_adventure_map_hnin 2.png', width: 321.w, height: 251.h),
              ),

              // 2. جمل الترحيب
              Positioned(
                top: 184.h, left: 102.w,
                child: Text('Welcome back', style: textTheme.titleMedium),
              ),
              Positioned(
                top: 217.h, left: 100.w,
                child: Text('sign in to access your account', style: textTheme.bodyMedium),
              ),

              // 3. الحقول النصية
              Positioned(
                top: 342.h, left: 20.w,
                child: const CustomTextField(hintText: 'Enter your email', suffixIcon: Icons.email_outlined),
              ),
              Positioned(
                top: 404.h, left: 20.w,
                child: const CustomTextField(hintText: 'Password', suffixIcon: Icons.visibility_off_outlined, isPassword: true),
              ),

              // 4. ريممبر مي و فورغيت باسوورد
              Positioned(
                top: 468.h, left: 22.w,
                child: Row(
                  children: [
                    Container(
                      width: 12.w, height: 12.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        border: Border.all(color: const Color(0xFFCBCBCB)),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text('Remember me', style: TextStyle(fontSize: 9.sp, color: Colors.black)),
                  ],
                ),
              ),
              Positioned(
                top: 468.h, left: 299.w,
                child: Text('Forget password?', style: TextStyle(fontSize: 9.sp, color: AppTheme.primaryColor)),
              ),

              // 5. زر Next
              Positioned(
                top: 726.h, left: 20.w,
                child: PrimaryButton(text: 'Next', onPressed: () {Navigator.pushReplacement(context, FadeRoute(page: const VerifyScreen()));}),
              ),

              // 6. Register Now
              Positioned(
                top: 790.h, left: 107.w,
                child: GestureDetector(
                  onTap: () { Navigator.pushReplacement(context, FadeRoute(page: const SignUpScreen()));},
                  child: RichText(
                    text: TextSpan(
                      style: textTheme.bodySmall,
                      children: [
                        const TextSpan(text: 'New member? ', style: TextStyle(color: Colors.black)),
                        TextSpan(text: 'Register now', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}