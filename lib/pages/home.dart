import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 139.h, left: 17.w,
            child: Text('Welcome to Home', style: Theme.of(context).textTheme.titleMedium),
          ),

          Positioned(
            top: 274.h, left: 28.w,
            child: Image.asset(
              'assets/images/Group 35.png', 
              width: 300.w,
              height: 155.h,
            ),
          ),
        ],
      ),
    );
  }
}