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

    group('Multiple numbers', () {
      // failed test case for handling any amount of numbers
      test('should fail on handling any amount of numbers', () {
        expect(calculator.add('1,2,3,4,5,6,7,8,9,'), equals(55));
      });

      test('should handle any amount of numbers', () {
        expect(calculator.add('1,2,3'), equals(6));
        expect(calculator.add('1,2,3,4,5'), equals(15));
        expect(calculator.add('10,20,30,40'), equals(100));
      });
    });

    group('New line delimiter', () {
      // failed test case for handling new lines between numbers
      test('should fail on handling new lines between numbers', () {
        expect(calculator.add('1\n2,3'), equals(7));
      });

      test('should handle new lines between numbers', () {
        expect(calculator.add('1\n2,3'), equals(6));
        expect(calculator.add('1\n2\n3'), equals(6));
        expect(calculator.add('1,2\n3,4'), equals(10));
      });
    });

    group('Custom delimiters', () {
      test('should support custom delimiter', () {
        expect(calculator.add('//;\n1;2'), equals(3));
        expect(calculator.add('//|\n1|2|3'), equals(6));
        expect(calculator.add('//*\n1*2*3*4'), equals(10));
      });

      test('should handle custom delimiter with single number', () {
        expect(calculator.add('//;\n5'), equals(5));
      });

      test('should handle custom delimiter with empty numbers', () {
        expect(calculator.add('//;\n'), equals(0));
      });
    });

    group('Negative numbers', () {
      test('should throw exception for single negative number', () {
        expect(
            () => calculator.add('-1'),
            throwsA(predicate((e) =>
                e is Exception &&
                e.toString().contains('negative numbers not allowed -1'))));
      });

      test('should throw exception for multiple negative numbers', () {
        expect(
            () => calculator.add('-1,2,-3'),
            throwsA(predicate((e) =>
                e is Exception &&
                e.toString().contains('negative numbers not allowed -1, -3'))));
      });

      test('should throw exception for negative numbers with custom delimiter',
          () {
        expect(
            () => calculator.add('//;\n-1;2;-3'),
            throwsA(predicate((e) =>
                e is Exception &&
                e.toString().contains('negative numbers not allowed -1, -3'))));
      });

      test('should throw exception for negative numbers with newlines', () {
        expect(
            () => calculator.add('1\n-2,3'),
            throwsA(predicate((e) =>
                e is Exception &&
                e.toString().contains('negative numbers not allowed -2'))));
      });
    });

    group('Edge cases', () {
      test('should handle spaces around numbers', () {
        expect(calculator.add(' 1 , 2 '), equals(3));
      });

      test('should handle zero', () {
        expect(calculator.add('0'), equals(0));
        expect(calculator.add('0,1'), equals(1));
        expect(calculator.add('1,0,2'), equals(3));
      });
    });
  });
}
