import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/models/english_today.dart';
import 'package:flutter_quotes/values/app_assets.dart';
import 'package:flutter_quotes/values/app_colors.dart';
import 'package:flutter_quotes/values/app_styles.dart';

class AllWordsPage extends StatefulWidget {
  final List<EnglishToday> listWord;
  const AllWordsPage({super.key, required this.listWord});

  @override
  State<AllWordsPage> createState() => _AllWordsPageState();
}

class _AllWordsPageState extends State<AllWordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "English today",
          style: AppStyles.h3.copyWith(color: AppColors.textColor),
        ),
        backgroundColor: AppColors.secondColor,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(AppAssets.leftArrow)),
      ),
      body: Container(
        color: AppColors.secondColor,
        padding: const EdgeInsets.all(10),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
            children: widget.listWord.map((e) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: AutoSizeText(
                  e.noun ?? "",
                  maxLines: 1,
                  style: AppStyles.h4.copyWith(
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2, 3),
                            blurRadius: 5)
                      ]),
                ),
              );
            }).toList()),
      ),
    );
  }
}
