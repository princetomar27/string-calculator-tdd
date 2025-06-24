import 'package:string_calculator_kata/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('StringCalculator', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    group('Basic functionality', () {
      test('should return 0 for empty string', () {
        expect(calculator.add(''), equals(0));
      });

      test('should return number itself for single number', () {
        expect(calculator.add('1'), equals(1));
        expect(calculator.add('5'), equals(5));
      });

      test('should fail on return sum for two numbers', () {
        expect(calculator.add('3,5'), equals(9));
      });

      test('should return sum for two numbers', () {
        expect(calculator.add('1,2'), equals(3));
        expect(calculator.add('5,10'), equals(15));
      });
    });
  });
}
