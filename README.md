# String Calculator TDD Kata

A Test-Driven Development implementation of the classic String Calculator Kata, demonstrating software craftsmanship principles and clean coding practices.

## 🎯 Project Overview

This project implements a simple string calculator that can parse and sum numbers from various string formats. Built using strict TDD methodology, it showcases the Red-Green-Refactor cycle and incremental feature development.

## ✨ Features

- **Empty String Handling**: Returns 0 for empty input
- **Single & Multiple Numbers**: Handles any amount of numbers
- **Flexible Delimiters**: 
  - Comma-separated: `"1,2,3"`
  - Newline-separated: `"1\n2\n3"`
  - Mixed delimiters: `"1\n2,3"`
  - Custom delimiters: `"//;\n1;2;3"`
- **Input Validation**: Throws descriptive exceptions for negative numbers
- **Robust Parsing**: Handles edge cases and malformed input gracefully

## 🚀 Quick Start

### Prerequisites
- Dart SDK (>=2.17.0)

### Installation
```bash
git clone https://github.com/princetomar27/string-calculator-kata.git
cd string-calculator-kata
dart pub get
```

### Running Tests
```bash
dart test
```

### Usage Example
```dart
import 'lib/string_calculator.dart';

void main() {
  var calculator = StringCalculator();
  
  print(calculator.add(""));           // 0
  print(calculator.add("1"));          // 1
  print(calculator.add("1,5"));        // 6
  print(calculator.add("1\n2,3"));     // 6
  print(calculator.add("//;\n1;2"));   // 3
}
```

## 🧪 Test-Driven Development Process

This project was built following strict TDD principles, as evidenced by the commit history:

### Development Phases

1. **Project Setup** - Initial project structure and configuration
2. **Basic Test Cases** - Empty string and single number handling  
3. **Multiple Numbers** - Support for comma-separated values
4. **Newline Delimiters** - Mixed delimiter support
5. **Custom Delimiters** - User-defined separator characters
6. **Negative Number Validation** - Exception handling with detailed messages

### TDD Methodology

Each feature was developed using the **Red-Green-Refactor** cycle:

- 🔴 **Red**: Write a failing test
- 🟢 **Green**: Write minimal code to pass the test
- 🔵 **Refactor**: Improve code structure while maintaining functionality

## 📋 API Reference

### StringCalculator Class

#### `int add(String numbers)`

Calculates the sum of numbers in a string.

**Parameters:**
- `numbers` (String): Input string containing numbers

**Returns:**
- `int`: Sum of all numbers in the string

**Throws:**
- `Exception`: When negative numbers are provided

**Examples:**
```dart
calculator.add("");              // Returns: 0
calculator.add("1");             // Returns: 1
calculator.add("1,2");           // Returns: 3
calculator.add("1\n2,3");        // Returns: 6
calculator.add("//;\n1;2");      // Returns: 3
calculator.add("//|\n1|2|3");    // Returns: 6
calculator.add("-1,2");          // Throws: Exception
```

## 🏗️ Project Structure

```
string-calculator-kata/
├── lib/
│   └── string_calculator.dart    # Main implementation
├── test/
│   └── string_calculator_test.dart # Comprehensive test suite
├── .gitignore
├── pubspec.yaml                  # Project dependencies
└── README.md                     # This file
```
 

### Error Handling

The calculator validates input and provides clear error messages:

```dart
// Single negative number
calculator.add("-1");           // Exception: "negative numbers not allowed -1"

// Multiple negative numbers  
calculator.add("-1,2,-3");      // Exception: "negative numbers not allowed -1, -3"
```

## 📊 Test Coverage

The test suite includes comprehensive coverage for:

- ✅ Basic functionality (empty, single, multiple numbers)
- ✅ Delimiter variations (comma, newline, custom)
- ✅ Error conditions (negative numbers)
- ✅ Edge cases (spaces, zeros, empty sections)
- ✅ Integration scenarios (mixed delimiters)

## 🔄 Git Workflow

This project demonstrates professional Git practices:

- **Feature Branches**: Each feature developed in isolated branches
- **Pull Requests**: Code review process via PRs
- **Atomic Commits**: Each commit represents a single logical change
- **Descriptive Messages**: Clear commit messages following conventional format

### Commit History Highlights

```
✅ Merge pull request #4 from princetomar27/5--negative-numbers
✅ Merge pull request #3 from princetomar27/4--custom-delimiters  
✅ Merge pull request #2 from princetomar27/3--multiple-num-new-line-delimiteres
✅ Merge pull request #1 from princetomar27/2--basic-test-case
✅ first test for empty string
✅ Project initiated
```

## 🎓 Learning Outcomes

This kata demonstrates:

- **Test-Driven Development**: Red-Green-Refactor methodology
- **Clean Code**: Readable, maintainable implementation
- **SOLID Principles**: Single responsibility and open-closed principles
- **Git Best Practices**: Professional version control workflow
- **Incremental Development**: Building features step-by-step
