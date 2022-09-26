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

    ll.add("apple").add("banana");
    LinkedList<String> llCap = ll.mapC((word) => DoubleString(word));
    expect(llCap[0], "appleapple");
    expect(llCap[1], "bananabanana");
  });

  test("containsC Functionality Test", () {
    ll.add("a").add("b").add("d");
    expect(ll.containsC("a"), true);
    expect(ll.containsC("b"), true);
    expect(ll.containsC("c"), false);
    expect(ll.containsC("d"), true);
  });

  test("equals Functionality Test - Different Objects", () {
    ll.add("abc").add("def").add("wildcard");
    expect(ll.equals(5), false);
  });
  test("equals Functionality Test 2 - Different Types", () {
    ll.add("abc").add("def").add("wildcard");
    LinkedList<int> ll2 = new LinkedList()..add(4);
    expect(ll.equals(ll2), false);
  });
  test("equals Fucntionality Test 3 - Different Sizes", () {
    ll.add("abc").add("def").add("wildcard");
    LinkedList<String> ll3 = new LinkedList()..add("abc");
    expect(ll.equals(ll3), false);
  });
  test("equals Functionality Test 4 - Different Contents", () {
    ll.add("abc").add("def").add("wildcard");
    LinkedList<String> ll4 = new LinkedList()
      ..add("abc")
      ..add("def")
      ..add("ghi");
    expect(ll.equals(ll4), false);
  });
  test("equals Functionality Test 5 - ", () {
    ll.add("abc").add("def").add("wildcard");
    LinkedList<String> ll5 = new LinkedList()
      ..add("abc")
      ..add("def")
      ..add("wildcard");
    expect(ll.equals(ll5), true);
  });
}
