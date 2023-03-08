import 'package:flutter/material.dart';
import 'package:flutter_quotes/values/app_assets.dart';
import 'package:flutter_quotes/values/app_colors.dart';
import 'package:flutter_quotes/values/app_styles.dart';
import 'package:flutter_quotes/values/share_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double value = 5;
  late SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    getPref();
  }

  void getPref() async {
    pref = await SharedPreferences.getInstance();
    int temp = pref.getInt(ShareKeys.count) ?? 5;
    setState(() {
      value = temp.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.secondColor,
          elevation: 0,
          leading: InkWell(
              onTap: () async {
                await pref.setInt(ShareKeys.count, value.toInt());
                Navigator.pop(context);
              },
              child: Image.asset(AppAssets.leftArrow)),
          title: Text(
            "Your control",
            style: AppStyles.h3.copyWith(color: Colors.black),
          )),
      body: Container(
        color: AppColors.secondColor,
        alignment: Alignment.center,
        child: Column(children: [
          Spacer(),
          Text(
            "How much a number word at once",
            style:
                AppStyles.h5.copyWith(fontSize: 20, color: AppColors.greyText),
          ),
          Spacer(),
          Spacer(),
          Text(
            "${value.toInt()}",
            style: AppStyles.h1.copyWith(
                fontSize: 150,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor),
          ),
          Spacer(),
          Slider(
              min: 5,
              max: 100,
              value: value,
              divisions: 95,
              onChanged: (newValue) {
                print("on changed");
                setState(() {
                  value = newValue;
                });
              }),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 27),
            child: Text(
              "slide to set",
              style: AppStyles.h5
                  .copyWith(fontSize: 20, color: AppColors.textColor),
            ),
          ),
          Spacer(
            flex: 6,
          ),
        ]),
      ),
    );
  }
}
