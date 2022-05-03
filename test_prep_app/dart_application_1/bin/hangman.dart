import 'dart:io';
import 'dart:math';


class HangmanV3 {
  late String word;
  final List<String> words = [
    "apple",
    "banana",
    "orange",
    "pear",
  ];
  late List<String> guessedRightLetters;
  late List<String> guessedWrongLetters;
  late List<String> output;
  late int trys;

  HangmanV3() {
    word = words[Random().nextInt(words.length)];
    output = List.generate(word.length, (i) => '_');
    guessedWrongLetters = <String>[];
    guessedRightLetters = <String>[];
    trys = 0;
  }

  bool validate(String letter) {
    try {
      return letter.length == 1;
    } catch (e) {
      return false;
    }
  }

  void guessIndex(String letter) {
    if (!word.contains(letter)) {
      guessedWrongLetters.add(letter);
      print("Character not in the string");
    } else if (guessedRightLetters.contains(letter) ||
        guessedWrongLetters.contains(letter)) {
      print("Character already guessed");
    } else {
      guessedRightLetters.add(letter);
      for (int i = 0; i < word.length; i++) {
        if (word[i] == letter) {
          output[i] = letter;
        }
      }
    }
  }

  void start() {
    while (trys < word.length + 20) {
      print(output);
      trys++;
      print("Trys: $trys");
      print("Enter the letter: ");
      String letter = stdin.readLineSync()!;
      if (validate(letter)) {
        guessIndex(letter);
      } else {
        print("Enter a correct input");
      }
      if (!output.contains("_")) {
        print("You won Tchalla");
        return;
      }
    }
    print("Padh jake! ek word nahi guess kar pa raha");
  }
}
