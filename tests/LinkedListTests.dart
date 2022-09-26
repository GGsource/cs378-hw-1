import '../LinkedList.dart';

import 'package:test/test.dart';

void main(List<String> args) {
  late LinkedList<int> numberList;

  setUp((() {
    numberList = new LinkedList();
  }));

  test('Empty list is empty', () {
    expect(0, numberList.getSize());
  });

  test("Add() method adds item", () {
    numberList.add(50);
    expect(1, numberList.getSize());
    expect(50, numberList[0]);
  });

  test("Add() method can be cascaded", () {
    numberList.add(10).add(20).add(30);
    expect(3, numberList.getSize());
    expect(10, numberList[0]);
    expect(20, numberList[1]);
    expect(30, numberList[2]);
  });

  test("Can use iterator to traverse", () {
    numberList.add(100).add(200).add(300);
    var expectedVals = [100, 200, 300];
    int ndx = 0;
    for (var it = numberList.iterator; it.moveNext();) {
      expect(expectedVals[ndx++], it.current);
    }
  });

  test("Can use for-in to traverse", () {
    numberList.add(300).add(200).add(100);
    var expectedVals = [300, 200, 100];
    int ndx = 0;
    for (var item in numberList) {
      expect(expectedVals[ndx++], item);
    }
  });

  test("Copy() returned list is same size & values as original", () {
    int ndx = 0;
    numberList.add(1).add(2).add(3);
    LinkedList<int> dupeList = numberList.copy();
    for (var item in dupeList) {
      expect(numberList[ndx++], item);
    }
  });

  test("Copy() returned list is not tethered to original when changes are made",
      () {
    numberList.add(17).add(18).add(19);
    LinkedList<int> dupeList = numberList.copy();
    dupeList.add(20);
    expect(numberList.getSize() + 1, dupeList.getSize());
  });
}
