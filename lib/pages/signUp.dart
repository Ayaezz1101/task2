import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/pages/signIn.dart';
import 'package:task2/pages/verify.dart';
import 'package:task2/srvices/pageTransition.dart';
import 'package:task2/theme/themeData.dart';
import 'package:task2/wigets/brimaryButton.dart';

import 'package:task2/wigets/textField.dart'; 
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 390.w,
          height: 844.h,
          child: Stack(
            children: [
            
              Positioned(
                top: 42.h,
                left: 75.w,
                child: Image.asset(
                  'assets/images/undraw_adventure_map_hnin 2.png',
                  width: 321.w,
                  height: 251.h,
                ),
              ),

              Positioned(
                top: 159.h,
                left: 90.w,
                child: Text('Get Started', style: textTheme.displaySmall),
              ),
              Positioned(
                top: 211.h,
                left: 101.w,
                child: Text(
                  'by creating a new account',
                  style: textTheme.bodyMedium,
                ),
              ),

              // Full Name
              Positioned(
                top: 251.h,
                left: 20.w,
                child: const CustomTextField(
                  hintText: 'Full Name',
                  suffixIcon: Icons.person_outline,
                ),
              ),
              // Valid Email
              Positioned(
                top: 311.h,
                left: 20.w,
                child: const CustomTextField(
                  hintText: 'Valid Email',
                  suffixIcon: Icons.email_outlined,
                ),
              ),
              // Phone Number
              Positioned(
                top: 371.h,
                left: 20.w,
                child: const CustomTextField(
                  hintText: 'Phone number',
                  suffixIcon: Icons.phone_android_outlined,
                ),
              ),
              // Strong Password
              Positioned(
                top: 431.h,
                left: 20.w,
                child: const CustomTextField(
                  hintText: 'Strong password',
                  suffixIcon: Icons.visibility_off_outlined,
                  isPassword: true,
                ),
              ),

              Positioned(
                top: 499.h,
                left: 56.w,
                child: Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        border: Border.all(color: const Color(0xFFCBCBCB)),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'By checking the box you agree to our Terms and Conditions',
                      style: TextStyle(fontSize: 9.sp, color: Colors.black),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 726.h,
                left: 20.w,
                child: PrimaryButton(
                  text: 'Next',
                  onPressed: () {
                   Navigator.pushReplacement(context, FadeRoute(page: const VerifyScreen()));
                  },
                ),
              ),

              Positioned(
                top: 791.h,
                left: 110.w,
                child: GestureDetector(
                  onTap: () {Navigator.pushReplacement(context, FadeRoute(page: const SignInScreen()));
                  },
                  child: RichText(
                    text: TextSpan(
                      style: textTheme.bodySmall,
                      children: [
                        const TextSpan(
                          text: 'Already a member? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
