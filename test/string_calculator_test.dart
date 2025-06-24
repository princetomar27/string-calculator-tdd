import 'package:string_calculator_kata/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('should return 0 for empty string', () {
    var calculator = StringCalculator();
    expect(calculator.add(''), equals(0));
  });
}
