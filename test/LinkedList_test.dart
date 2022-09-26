import 'package:CustomLinkedList/Collection.dart';
import 'package:CustomLinkedList/LinkedList.dart';
import 'package:test/test.dart';

void main() {
  late LinkedList<int> numberList;

  setUp((() {
    numberList = new LinkedList();
  }));

  test('Empty list is empty', () {
    expect(numberList.getSize(), 0);
  });

  test("Add() method adds item", () {
    numberList.add(50);
    expect(numberList.getSize(), 1);
    expect(numberList[0], 50);
  });

  test("Add() method can be cascaded", () {
    numberList.add(10).add(20).add(30);
    expect(numberList.getSize(), 3);
    expect(numberList[0], 10);
    expect(numberList[1], 20);
    expect(numberList[2], 30);
    numberList.add(40)
      ..add(50)
      ..add(60)
      ..add(70);
    expect(numberList[3], 40);
    expect(numberList[4], 50);
    expect(numberList[5], 60);
    expect(numberList[6], 70);
  });

  test("Can use iterator to traverse", () {
    numberList.add(100).add(200).add(300);
    var expectedVals = [100, 200, 300];
    int ndx = 0;
    for (var it = numberList.iterator; it.moveNext();) {
      expect(it.current, expectedVals[ndx++]);
    }
  });

  test("Can use for-in to traverse", () {
    numberList.add(300).add(200).add(100);
    var expectedVals = [300, 200, 100];
    int ndx = 0;
    for (var item in numberList) {
      expect(item, expectedVals[ndx++]);
    }
  });

  test("Copy() returned list is same size & values as original", () {
    int ndx = 0;
    numberList.add(1).add(2).add(3);
    Collection<int> dupeList = numberList.copy();
    for (var item in dupeList) {
      expect(item, numberList[ndx++]);
    }
  });

  test("Copy() returned list is not tethered to original when changes are made",
      () {
    numberList.add(17).add(18).add(19);
    Collection<int> dupeList = numberList.copy();
    dupeList.add(20);
    expect(numberList.getSize() + 1, dupeList.getSize());
  });

  test("operator[] throws Exception if index outside bounds", () {
    numberList.add(3).add(6).add(9);
    expect(() => numberList[3], throwsException);
  });
}
