import 'package:flutter/material.dart';
import 'package:flutter_quotes/models/english_today.dart';
import 'package:flutter_quotes/pages/all_words_page.dart';
import 'package:flutter_quotes/values/app_colors.dart';
import 'package:flutter_quotes/values/app_styles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final dynamic onTap;
  const AppButton({super.key, required this.text, required this.onTap});

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

class ShowMoreWidget extends StatelessWidget {
  final List<EnglishToday> listWord;
  const ShowMoreWidget({super.key, required this.listWord});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShowMoreButton(
            text: "Show more gird",
            pageWidget: AllWordsPage(listWord: listWord)),
        ShowMoreButton(
            text: "Show more list",
            pageWidget: ListWordsPage(listWord: listWord))
      ],
    );
  }
}

class ShowMoreButton extends StatelessWidget {
  final Widget pageWidget;
  final String text;
  const ShowMoreButton(
      {super.key, required this.text, required this.pageWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Material(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return pageWidget;
              },
            ));
          },
          splashColor: Colors.black38,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: AppStyles.h5.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
