import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});
  final double weight;
  final double height;
  double _bmi;
  String _result;
  String _interpret;
  Map<String, String> legend = {
    'UNDERWEIGHT':
        'You have lower index than normal body weight. You can eat a bit more.',
    'NORMAL': 'You have normal body weight. Good job!',
    'OVERWEIGHT':
        'You have higher than normal body weight. Try to excercise more.',
  };
  double getBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi;
  }

  String getResult() {
    if (_bmi >= 25) {
      _result = 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      _result = 'NORMAL';
    } else {
      _result = 'UNDERWEIGHT';
    }
    return _result;
  }

  String getInterpret() {
    _interpret = legend[_result];
    return _interpret;
  }
}
