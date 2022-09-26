import 'dart:collection';

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
    //FIXME: []operator not functional yet
    //expect(50, numberList[0]);
  });

  test("Add() method can be cascaded", () {
    numberList.add(10).add(20).add(30);
    expect(3, numberList.getSize());
    // expect(10, numberList[0]);
    // expect(20, numberList[1]);
    // expect(30, numberList[2]);
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
}