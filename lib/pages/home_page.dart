import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/models/english_today.dart';
import 'package:flutter_quotes/pages/control_page.dart';
import 'package:flutter_quotes/utils/data.dart';
import 'package:flutter_quotes/values/app_assets.dart';
import 'package:flutter_quotes/values/app_colors.dart';
import 'package:flutter_quotes/values/app_fonts.dart';
import 'package:flutter_quotes/values/app_styles.dart';
import 'package:flutter_quotes/values/share_keys.dart';
import 'package:flutter_quotes/widgets/app_buttons.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  late PageController controller;
  late List<EnglishToday> listWord = List.empty();
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.9);
    super.initState();
    getListEnglishToday();
  }

  void getListEnglishToday() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int count = await pref.getInt(ShareKeys.count) ?? 5;
    List<String> words =
        Utils.getListWord(Utils.getListRandomNumber(count, 0, nouns.length));
    setState(() {
      listWord = words.map((e) => EnglishToday(noun: e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0,
        title: Text(
          "English Today",
          style:
              AppStyles.h3.copyWith(color: AppColors.textColor, fontSize: 36),
        ),
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Image.asset(AppAssets.menu),
        ),
      ),
      body: Container(
        width: double.infinity,
        // margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 1 / 10 * size.height,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              '"It\'s amazing how complete is the delusion that beauty is goodness"',
              style: AppStyles.h5
                  .copyWith(fontSize: 12, color: AppColors.textColor),
            ),
          ),
          Container(
            height: 2 / 3 * size.height,
            child: PageView.builder(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: listWord.length,
              itemBuilder: (context, index) {
                return pageWidget(
                  word: listWord[index],
                );
              },
            ),
          ),
          currentIndex >= 5
              ? ShowMoreWidget(
                  listWord: listWord,
                )
              : Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listWord.length,
                      itemBuilder: (context, index) {
                        return indicatorBuilder(
                            index == currentIndex, size.width);
                      }),
                )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          getListEnglishToday();
        },
        child: Image.asset(AppAssets.exchange),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.only(top: 40, left: 20),
          color: AppColors.lighBlue,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Your mind",
              style: AppStyles.h3.copyWith(color: AppColors.textColor),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20, right: 20),
                child: AppButton(text: 'Favorites', onTap: () {})),
            Container(
                margin: const EdgeInsets.only(top: 40, right: 20),
                child: AppButton(
                    text: 'Your control',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ControlPage();
                        },
                      ));
                    }))
          ]),
        ),
      ),
    );
  }
}

class pageWidget extends StatefulWidget {
  EnglishToday word;
  pageWidget({super.key, required this.word});

  @override
  State<pageWidget> createState() => _pageWidgetState();
}

class _pageWidgetState extends State<pageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 7, right: 7, bottom: 10),
      child: Material(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.primaryColor,
        elevation: 5,
        child: InkWell(
          onDoubleTap: () {
            setState(() {
              // widget.word.isFavourite = !widget.word.isFavourite;
            });
          },
          borderRadius: BorderRadius.circular(24),
          splashColor: Colors.black38,
          child: Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Container(
              //   alignment: Alignment.centerRight,
              //   child: Image.asset(
              //     AppAssets.heart,
              //     color: widget.word.isFavourite ? Colors.red : Colors.white,
              //   ),
              // ),
              LikeButton(
                isLiked: widget.word.isFavourite,
                onTap: (isLiked) async {
                  setState(() {
                    widget.word.isFavourite = !widget.word.isFavourite;
                  });
                  return widget.word.isFavourite;
                },
                mainAxisAlignment: MainAxisAlignment.end,
                size: 48,
                circleColor: const CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: const BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (bool isLiked) {
                  // return Icon(
                  //   Icons.home,
                  //   color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                  //   size: 48,
                  // );
                  return ImageIcon(
                    AssetImage(AppAssets.heart),
                    color: widget.word.isFavourite ? Colors.red : Colors.white,
                  );
                },
              ),
              RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  text: TextSpan(
                      text: Utils.getFirst(widget.word.noun),
                      style: TextStyle(
                          fontFamily: FontFamily.sen,
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            BoxShadow(
                                color: Colors.black38,
                                offset: Offset(3, 6),
                                blurRadius: 6)
                          ]),
                      children: [
                        TextSpan(
                          text: Utils.excludeFirst(widget.word.noun),
                          style: TextStyle(
                            fontFamily: FontFamily.sen,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ])),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: AutoSizeText(
                  '''"Think of all the beauty happy""Think of all the beauty still left around you and be happy"''',
                  maxFontSize: 26,
                  maxLines: 7,
                  style: AppStyles.h4.copyWith(
                      letterSpacing: 1,
                      color: AppColors.textColor,
                      fontSize: 30),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

Widget indicatorBuilder(bool isActive, double size) {
  return AnimatedContainer(
    width: isActive ? 1 / 5 * size : 30,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
        color: isActive ? AppColors.lighBlue : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
        ]),
    duration: const Duration(milliseconds: 300),
  );
}
