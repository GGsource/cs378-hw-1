import 'LinkedList.dart';

abstract class Collection<T extends Comparable> extends Iterable {
  Collection<T> add(T givenVal); //Returns the receiver with new addition
  Collection<T> copy(); //Returns a copy of the receiver
  T operator [](int index);
  void printString();
  late int _size;

  //Collection Constructor
  Collection() {
    _size = 0;
  }

  //mapC -
  //Takes the current collection and returns a linkedlist containing each
  //member of the collection after having the given function applied to them
  LinkedList<T> mapC(T Function(T arg) fn) {
    LinkedList<T> returnList = new LinkedList<T>();
    for (int i = 0; i < _size; i++) {
      //Takes value of collection at i and applies fn to it
      //then saves result into returnList
      returnList.add(fn(this[i]));
    }
    return returnList;
  }

  //containsC -
  //Takes in arbitrary Object and checks whether it is inside the receiver collection
  bool containsC(Object obj) {
    for (int i = 0; i < _size; i++) {
      if (this[i] == obj) {
        return true;
      }
    }
    return false;
  }

  //equals -
  //Takes in arbitrary Object and checks whether it is equal to the receiver collection
  bool equals(Object obj) {
    //First check received item's type - if its not the same as ours, return false
    if (this.runtimeType != obj.runtimeType) return false;
    //Now we know its a list of our type, cast as such
    Collection<T> objCollection = obj as Collection<T>;
    //Now check if the sizes match up before traversing, if not return false
    if (this.getSize() != objCollection.getSize()) return false;
    //Theyre the same type and size, all thats left is to check each value
    for (int i = 0; i < _size; i++) {
      //If any value is different, return false
      if (this[i] != objCollection[i]) return false;
    }
    //Everything was the same, these are logically equivalent!
    return true;
  }

  //getSize -
  //Returns the size of the collection
  int getSize() {
    return _size;
  }

  //_incrementSize -
  //increments _size private data member
  void incrementSize() {
    _size += 1;
  }
}
