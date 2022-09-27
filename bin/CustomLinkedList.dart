import 'package:CustomLinkedList/LinkedList.dart';

void main(List<String> args) {
  LinkedList<int> numberList = new LinkedList();

  print("Empty LinkedList:");
  numberList.printString();

  print("LinkedList after adding 1 item");
  numberList.add(givenVal: 200);
  numberList.printString();

  print("Linked list after having 4 items");
  numberList.add(givenVal: 10).add(givenVal: 20).add(givenVal: 5);
  numberList.printString();

  print("Now attempting to iterate through list:");
  for (var it = numberList.iterator; it.moveNext();) {
    print(it.current);
  }
  print("Now attempting for-in:");
  for (var element in numberList) {
    print(element);
  }

  print("Now attempting list.forEach");
  numberList.forEach((element) {
    print(element);
  });

  print(
      "Switched testing to test files in test directory. Run tests with \'dart test\'.");
}
