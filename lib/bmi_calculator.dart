import 'dart:math';
import 'package:bmirechner/constants.dart';
import 'package:flutter/material.dart';

class BMICalculator {
  BMICalculator({
    required this.gender,
    required this.age,
    required this.height,
    required this.weight
  });

  final String gender;
  final int age;
  final int height;
  final int weight;
  late double _bmi;

  String BMICalculation() {
    _bmi = weight / pow(height / 100, 2); // pow = Berechnung zum quadrat
    return _bmi.toStringAsFixed(1); // Eine Nachkommastelle
  }

  String getBMIText() {
    if (gender == kFemale) {
      if (_bmi >= 25) {
        return 'Übergewicht > 25';
      } else if (_bmi >= 19) {
        return 'Normal 19 - 24';
      } else {
        return 'Untergewicht < 19';
      }
    } else {
      if (_bmi >= 26) {
        return 'Übergewicht > 26';
      } else if (_bmi >= 20) {
        return 'Normal 20 - 25';
      } else {
        return 'Untergewicht < 20';
      }
    }
  }

  Color getBMIColor() {
    if (gender == kFemale) {
      if (_bmi >= 25) {
        return kOverweightColor;
      } else if (_bmi >= 19) {
        return kNormalweighttColor;
      } else {
        return kUnderweightColor;
      }
    } else {
      if (_bmi >= 26) {
        return kOverweightColor;
      } else if (_bmi > 20) {
        return kNormalweighttColor;
      } else {
        return kUnderweightColor;
      }
    }
  }
}
