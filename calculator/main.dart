import 'dart:io';

void main() {
  Map<String, dynamic> input = getInput();
  double result = calc(input['number1'], input['operator'], input['number2']);

  print(
      "${input['number1']} ${input['operator']} ${input['number2']} = $result");
}

Map<String, dynamic> getInput() {
  stdout.write("Type an operation: ");
  List<String>? input = stdin.readLineSync()?.split(' ');
  if (input?.length != 3 && !input!.contains(' ')) {
    print(
        "You typed in wrong format! Try again! Format: {number1} {operator} {number2}");
    return getInput();
  }

  return {
    'number1': double.parse(input![0]),
    'operator': input[1],
    'number2': double.parse(input[2]),
  };
}

double calc(double number1, String operator, double number2) {
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
      return number1;
  }
}
