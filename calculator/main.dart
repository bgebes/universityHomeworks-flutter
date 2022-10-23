import 'dart:io';

void main() {
  runApp();
}

void runApp() {
  for (int i = 0;; i++) {
    Map<String, dynamic> input = getOperation();
    dynamic result =
        calc(input['number1'], input['operator'], input['number2']);

    print(
        "${input['number1']} ${input['operator']} ${input['number2']} = $result");

    if (askToExit(i)) break;
  }
}

Map<String, dynamic> getOperation() {
  stdout.write("Type an operation: ");
  List<String>? input = stdin.readLineSync()?.split(' ');

  try {
    return {
      'number1': double.parse(input![0]),
      'operator': input[1],
      'number2': double.parse(input[2]),
    };
  } catch (Exception) {
    print(
        "You typed in wrong format! Try again! Format: {number1} {operator} {number2}");
    return getOperation();
  }
}

dynamic calc(double number1, String operator, double number2) {
  switch (operator) {
    case '+':
      return number1 + number2;
    case '-':
      return number1 - number2;
    case '*':
      return number1 * number2;
    case '/':
      return number1 / number2;
    default:
      print("You typed unavailable operator! Available Operators: + - * /");
      return '?';
  }
}

bool askToExit(int i) {
  if (i == 0 || (i % 3).floor() != 0) return false;

  stdout.write("Would you like to exit?[Y-n]: ");
  String res = stdin.readLineSync()?.toUpperCase() ?? 'N';

  return res == 'Y';
}
