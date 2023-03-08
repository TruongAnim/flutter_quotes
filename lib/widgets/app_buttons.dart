import 'package:flutter/material.dart';
import 'package:flutter_quotes/models/english_today.dart';
import 'package:flutter_quotes/pages/all_words_page.dart';
import 'package:flutter_quotes/values/app_colors.dart';
import 'package:flutter_quotes/values/app_styles.dart';

class AppButton extends StatelessWidget {
  String text;
  dynamic onTap;
  AppButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38, offset: Offset(3, 4), blurRadius: 4)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          text,
          style:
              AppStyles.h4.copyWith(color: AppColors.textColor, fontSize: 20),
        ),
      ),
    );
  }
}

class ShowMoreButton extends StatelessWidget {
  List<EnglishToday> listWord;
  ShowMoreButton({super.key, required this.listWord});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 10),
      alignment: Alignment.centerLeft,
      child: Material(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return AllWordsPage(listWord: listWord);
              },
            ));
          },
          splashColor: Colors.black38,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Show more",
              style: AppStyles.h5.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
