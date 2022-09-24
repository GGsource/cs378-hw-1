import 'LinkedList.dart';

abstract class Collection<T extends Comparable> extends Object {
  Collection<T> add(T givenVal); //Returns the receiver with new addition
  Collection<T> copy(); //Returns a copy of the receiver
  T operator [](int index);
  void printString();
  int _size = 0;

  //Collection Constructor
  Collection() {}

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
    Collection<T> objCollection = obj as Collection<T>;
    if (this.runtimeType != obj.runtimeType) return false;
    for (int i = 0; i < _size; i++) {
      //FIXME: Not null safe?
      if (this[i] == objCollection[i]) return false;
    }
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
