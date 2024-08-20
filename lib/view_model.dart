import 'package:flutter/cupertino.dart';

class ViewModel with ChangeNotifier {
  String firstProblem(int value) {
    var result = StringBuffer('');
    for (var i = 1; i <= value; i++) {
      result.write('$i ');
    }
    return result.toString();
  }

  String secondProblem(int value) {
    var result = StringBuffer('');
    var j = 1;
    for (var i = 1; i <= (value * 2)-1; i++) {
      if (i <= value) {
        result.write('$i ');
      } else {
        final int tempVal = value - j;
        result.write('$tempVal ');
        j++;
      }
    }
    return result.toString();
  }

  String thirdProblem(int value) {
    var result = StringBuffer('');
    var initial = 10;
    for (var i = 0; i < value; i++) {
      result.write('$initial ');
      initial += 11;
    }
    return result.toString();
  }

  String fourthProblem(int value) {
    var result = StringBuffer('');
    for (var i = 1; i <= value; i++) {
      if (i % 5 == 0) {
        result.write('LIMA ');
      } else if (i % 7 == 0) {
        result.write('TUJUH ');
      } else {
        result.write('$i ');
      }
    }
    return result.toString();
  }
}