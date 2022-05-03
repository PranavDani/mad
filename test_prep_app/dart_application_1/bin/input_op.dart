import 'dart:io';

import 'dart:math';

void q9() {
  print("Enter a number: ");
  Map<String, String> num = {
    "1": "one",
    "2": "two",
    "3": "three",
    "4": "four",
    "5": "five",
    "6": "six",
    "7": "seven",
    "8": "eight",
    "9": "nine",
    "0": "zero"
  };
  String number = "${int.parse(stdin.readLineSync()!)}";
  for (int i = 0; i < number.length; i++) {
    print("${num[number[i]]}");
  }
  int k = int.parse(number);
  int i = 2;
  for (; i < int.parse(number); i++) {
    if (k % i == 0) {
      print(i);
      while (k % i == 0) {
        k = k ~/ i;
      }
    }
  }
  k = int.parse(number);
  i = 2;
  while (i < sqrt(int.parse(number))) {
    if (k % i == 0) {
      print("Number is not prime");
      break;
    }
    i++;
  }
  if (i >= sqrt(int.parse(number))) {
    print("Number is prime");
  }
}
