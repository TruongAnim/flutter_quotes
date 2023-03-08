import 'dart:math';
import 'package:english_words/english_words.dart';

class Utils {
  static List<int> getListRandomNumber(int count, int min, int max) {
    List<int> numberList = [];
    Random randomizer = new Random();
    while (numberList.length < count) {
      int random_number = randomizer.nextInt(max - min) + min;
      if (!numberList.contains(random_number)) {
        numberList.add(random_number);
      }
    }
    return numberList;
  }

  static List<String> getListWord(List<int> list) {
    return list.map((e) => nouns[e]).toList();
  }

  static String getFirst(String? source) {
    source = source ?? "hello";
    return source.substring(0, 1);
  }

  static String excludeFirst(String? source) {
    source = source ?? "hello";
    return source.substring(1);
  }
}
