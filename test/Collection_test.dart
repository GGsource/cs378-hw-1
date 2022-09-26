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
}
