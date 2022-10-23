import 'dart:io';

void main() {
  List<double> numbers = getNumbersFromConsoleAsList(10);
  List<double> sortedNumbers_Lower = sortArray(numbers);
  List<double> sortedNumbers_Higher = sortedNumbers_Lower.reversed.toList();

  print("\nNumbers: $numbers");
  print("Numbers that sorted by lower to higher: $sortedNumbers_Lower");
  print("Numbers that sorted by higher to lower: $sortedNumbers_Higher");
}

double getNumberFromConsole() {
  stdout.write("Type a number: ");
  String? temp = stdin.readLineSync();

  if (temp!.contains(' ') ||
      temp.contains(',') ||
      temp == '-0' ||
      temp.length < 1) {
    print(
        "You typed in wrong format! Try again! Format: {number} Example: 1 or 1.5 or 0");
    return getNumberFromConsole();
  }

  return double.parse(temp);
}

List<double> getNumbersFromConsoleAsList(int length) {
  List<double> temp = [];

  for (int i = 0; i < length; i++) {
    double input = getNumberFromConsole();
    temp.add(input);
  }

  return temp;
}

List<double> sortArray(List<double> array) {
  List<double> temp = [...array];
  temp.sort();

  return temp;
}
