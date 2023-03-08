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

class ListWordsPage extends StatelessWidget {
  final List<EnglishToday> listWord;
  const ListWordsPage({super.key, required this.listWord});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "English Today",
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
          child: ListView.builder(
            itemCount: listWord.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? AppColors.lighBlue
                        : AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2, 4),
                          blurRadius: 4)
                    ]),
                child: ListTile(
                  title: Text(
                    listWord[index].noun ?? "",
                    style: AppStyles.h4
                        .copyWith(color: AppColors.textColor, fontSize: 20),
                  ),
                  leading: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      AppAssets.heart,
                      color: listWord[index].isFavourite
                          ? Colors.red
                          : AppColors.lightGrey,
                    ),
                  ),
                  subtitle: Text(
                    "It\'s amazing how complete is the delusion that beauty is goodness",
                    style: AppStyles.h5.copyWith(color: AppColors.greyText),
                  ),
                ),
              );
            },
          )),
    );
  }
}
