import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/pages/home.dart';
import 'package:task2/srvices/pageTransition.dart';
import 'package:task2/wigets/brimaryButton.dart';
import 'package:task2/wigets/onboarding_button.dart';
import 'package:task2/wigets/otpbox.dart';
class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Almost there
          Positioned(
            top: 104.h, left: 10.w,
            child: Text('Almost there', style: textTheme.displaySmall),
          ),

          Positioned(
            top: 184.h, left: 10.w,
            child: SizedBox(
              width: 321.w,
              child: RichText(
                text: TextSpan(
                  style: textTheme.bodyMedium,
                  children: [
                    const TextSpan(text: 'Please enter the 6-digit code sent to your email '),
                    TextSpan(
                      text: 'contact.uiuxexperts@gmail.com',
                      style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const TextSpan(text: ' for verification.'),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 299.h, left: 40.w,
            child: Row(
              children: List.generate(6, (index) => Padding(
                padding: EdgeInsets.only(right: 14.w), 
                child: const OTPBox(),
              )),
            ),
          ),

          Positioned(
            top: 396.h, left: 20.w,
            child: PrimaryButton(
              text: 'Verify',
              onPressed: () {
                Navigator.push(context, FadeRoute(page: const HomeScreen()));
              },
            ),
          ),

          Positioned(
            top: 492.h, left: 77.w,
            child: Text('Didn’t receive any code? Resend Again', 
              style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
          ),
          Positioned(
            top: 514.h, left: 103.w,
            child: Text('Request a new code in 00:30s', 
              style: textTheme.bodySmall?.copyWith(color: Colors.black54)),
          ),

          Positioned(
            top: 708.h, left: 32.w,
            child: Transform.rotate(
              angle: 3.14159,
              child: NextStepButton(onPressed: () => Navigator.pop(context)),
            ),
          ),
        ],
      ),
    );
  }
}