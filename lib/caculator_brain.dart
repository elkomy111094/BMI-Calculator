import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi = 0.0;
  CalculatorBrain({required this.height, required this.weight});

  String calculateBMI() {
    /* return (weight / pow(height / 100, 2).floor()).toString();*/
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    calculateBMI();
    if (_bmi >= 25)
      return "OverWeight";
    else if (_bmi > 18.5)
      return "Normal";
    else {
      return "UnderWeight";
    }
  }

  String getInterpretation() {
    calculateBMI();
    if (_bmi >= 25)
      return "Your Are Sooo Fit , You Should Play Sport and Eat Less";
    else if (_bmi > 18.5)
      return "You Are Normal , You Tall Is Suitable To Your Weight , try to Stay on That ";
    else {
      return "Your weight  is Sooo Light , You Should Eat More ";
    }
  }
}
