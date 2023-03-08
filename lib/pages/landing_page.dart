import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quotes/pages/home_page.dart';
import 'package:flutter_quotes/values/app_assets.dart';
import 'package:flutter_quotes/values/app_colors.dart';
import 'package:flutter_quotes/values/app_styles.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: Text("Welcome to", style: AppStyles.h3),
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "English",
                  style: AppStyles.h2.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.blackGrey),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    'Quotes"',
                    style: AppStyles.h4.copyWith(height: 0.5),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: AppColors.secondColor,
                    elevation: 5),
                child: Image.asset(AppAssets.rightArrow),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => HomePage()),
                      (route) => false);
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
