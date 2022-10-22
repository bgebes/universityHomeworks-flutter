import 'dart:io';

void main() {
  List<int> numbers = getNumbersFromConsoleAsList(10);
  List<int> sortedNumbers_Lower = sortArray(numbers);
  List<int> sortedNumbers_Higher = sortedNumbers_Lower.reversed.toList();

  print("\nNumbers: $numbers");
  print("Numbers that sorted by lower to higher: $sortedNumbers_Lower");
  print("Numbers that sorted by higher to lower: $sortedNumbers_Higher");
}

int getNumberFromConsole() {
  stdout.write("Type a number: ");
  String? temp = stdin.readLineSync();

  if (temp!.contains(' ') ||
      temp.contains('.') ||
      temp.contains(',') ||
      temp.length < 1) {
    print("You typed in wrong format! Try again!");
    return getNumberFromConsole();
  }

  return int.parse(temp);
}

List<int> getNumbersFromConsoleAsList(int length) {
  List<int> temp = [];

  for (int i = 0; i < length; i++) {
    int input = getNumberFromConsole();
    temp.add(input);
  }

  return temp;
}

List<int> sortArray(List<int> array) {
  List<int> temp = [...array];
  temp.sort();

  return temp;
}
