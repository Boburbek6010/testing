import 'dart:async';

Future<Set<int>> multiplyByTwo(List<int> numbers) async {
  await Future.delayed(Duration(seconds: 1));
  return numbers.map((int value) => value * 2).toSet();
}


Iterable<int> addSquareToList(Set<int> setNumbers) sync* {
  for (var element in setNumbers) {
    yield element * element;
  }
}

Iterable<int> addSquareAfter(List<int> numbers) sync* {
  for (var element in numbers) {
    yield element;
    yield element * element;
  }
}

void main() async {
  List<int> numbers = [1, 2, 3, 4, 5];

  Set<int> setNumbers = await multiplyByTwo(numbers);
  print("Set Numbers: $setNumbers");

  List<int> powNumbers = addSquareToList(setNumbers).toList();
  print("List with Squares: $powNumbers");

  List<int> result = addSquareAfter(numbers).toList();
  print("Result: $result");
}
