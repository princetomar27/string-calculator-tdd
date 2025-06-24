class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = ',';
    String numbersToProcess = numbers;

    // Check for custom delimiter
    if (numbers.startsWith('//')) {
      int newlineIndex = numbers.indexOf('\n');
      if (newlineIndex != -1) {
        delimiter = numbers.substring(2, newlineIndex);
        numbersToProcess = numbers.substring(newlineIndex + 1);
      }
    }

    // Replace newlines with the current delimiter for uniform processing
    numbersToProcess = numbersToProcess.replaceAll('\n', delimiter);

    // Split by delimiter and convert to numbers
    List<String> numberStrings = numbersToProcess.split(delimiter);
    List<int> nums = [];
    List<int> negativeNumbers = [];

    for (String numStr in numberStrings) {
      if (numStr.isNotEmpty) {
        int num = int.parse(numStr.trim());
        if (num < 0) {
          negativeNumbers.add(num);
        }
        nums.add(num);
      }
    }

    // Check for negative numbers
    if (negativeNumbers.isNotEmpty) {
      String negativesList = negativeNumbers.join(', ');
      throw Exception('negative numbers not allowed $negativesList');
    }

    // Sum all numbers
    return nums.fold(0, (sum, num) => sum + num);
  }
}
