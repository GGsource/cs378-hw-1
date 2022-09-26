import 'LinkedList.dart';

void main(List<String> args) {
  LinkedList<int> numberList = new LinkedList();
  print("Empty LinkedList:");
  numberList.printString();
  print("LinkedList after adding 1 item");
  numberList.add(200);
  numberList.printString();
  print("Linked list after having 4 items");
  numberList.add(10).add(20).add(5);
  numberList.printString();
  print("Now attempting to iterate through list:");
  for (var it = numberList.iterator; it.moveNext();) {
    print(it.current);
  }
  print("Now attempting foreach:");
  for (var element in numberList) {
    print(element);
  }
}
