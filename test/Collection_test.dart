import 'package:CustomLinkedList/LinkedList.dart';
import 'package:test/test.dart';

void main() {
  late LinkedList<String> ll;

  setUp(() {
    ll = new LinkedList<String>();
  });

  test("mapC Functionality Test", () {
    String DoubleString(String s) {
      return s + s;
    }

    ll.add(givenVal: "apple").add(givenVal: "banana");
    LinkedList<String> llCap =
        ll.mapC(fn: ({required arg}) => DoubleString(arg));
    expect(llCap[0], "appleapple");
    expect(llCap[1], "bananabanana");
  });

  test("containsC Functionality Test", () {
    ll.add(givenVal: "a").add(givenVal: "b").add(givenVal: "d");
    expect(ll.containsC(obj: "a"), true);
    expect(ll.containsC(obj: "b"), true);
    expect(ll.containsC(obj: "c"), false);
    expect(ll.containsC(obj: "d"), true);
  });

  test("equals Functionality Test - Different Objects", () {
    ll.add(givenVal: "abc").add(givenVal: "def").add(givenVal: "wildcard");
    expect(ll.equals(obj: 5), false);
  });
  test("equals Functionality Test 2 - Different Types", () {
    ll.add(givenVal: "abc").add(givenVal: "def").add(givenVal: "wildcard");
    LinkedList<int> ll2 = new LinkedList()..add(givenVal: 4);
    expect(ll.equals(obj: ll2), false);
  });
  test("equals Fucntionality Test 3 - Different Sizes", () {
    ll.add(givenVal: "abc").add(givenVal: "def").add(givenVal: "wildcard");
    LinkedList<String> ll3 = new LinkedList()..add(givenVal: "abc");
    expect(ll.equals(obj: ll3), false);
  });
  test("equals Functionality Test 4 - Different Contents", () {
    ll.add(givenVal: "abc").add(givenVal: "def").add(givenVal: "wildcard");
    LinkedList<String> ll4 = new LinkedList()
      ..add(givenVal: "abc")
      ..add(givenVal: "def")
      ..add(givenVal: "ghi");
    expect(ll.equals(obj: ll4), false);
  });
  test("equals Functionality Test 5 - ", () {
    ll.add(givenVal: "abc").add(givenVal: "def").add(givenVal: "wildcard");
    LinkedList<String> ll5 = new LinkedList()
      ..add(givenVal: "abc")
      ..add(givenVal: "def")
      ..add(givenVal: "wildcard");
    expect(ll.equals(obj: ll5), true);
  });
}
