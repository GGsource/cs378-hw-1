import 'Collection.dart';

class LinkedList<T extends Comparable> extends Collection<T> {
  _LinkedNode<T>? head;
  _LinkedNode<T>? tail;

  //add -
  //Adds the given value to the linkedlist and returns the linkedlist.
  //Returning the same linkedlist allows for cascading calls i.e. ll.add(3).add(4);
  @override
  Collection<T> add({required T givenVal}) {
    // DONE: implement add
    //Create new node to attach
    _LinkedNode<T> newNode = new _LinkedNode(nodeVal: givenVal);
    //Update head and tail
    if (head == null) {
      //If head is null then this must be the first item
      head = tail = newNode;
    } else {
      //There are already items, so add after tail instead
      tail?.next = newNode;
      //Update tail to new end
      tail = tail?.next;
    }
    //Increase size, as something was added
    incrementSize();
    //Return the linked list
    return this;
  }

  //copy -
  //Creates a new linkedlist and copies all the old list's values over.
  //Returns the new copy, which has the same values but is adistinct instance.
  @override
  Collection<T> copy() {
    // DONE: implement copy
    LinkedList<T> copyList = new LinkedList<T>();
    for (var element in this) {
      copyList.add(givenVal: element);
    }
    return copyList;
  }

  // operator[] -
  //Dictates behavior for when linklist[index] is used. Returns the value in
  //the linked list at the specified index, or throws error if out of bounds.
  @override
  T operator []({required int index}) {
    // DONE: implement []
    if (index >= this.getSize()) {
      //If value is outside our size, throw error
      throw Exception("index is out of bounds...");
    }
    int ndx = 0;
    _LinkedNode<T>? traverser = head;
    while (ndx < index) {
      traverser = traverser?.next;
      ndx += 1;
    }
    return traverser?.val as T;
  }

  //printString -
  //Prints out all the values of the linkedlist in order, inside brackets
  //with comma separation between each. Looks nice.
  @override
  void printString() {
    // DONE: implement printString
    String printString = "LinkedList: [";
    _LinkedNode<T>? traverser = head;
    while (traverser != null) {
      printString += "${traverser.val}";
      if (traverser.next != null) {
        printString += ", ";
      }
      traverser = traverser.next;
    }
    printString += "]";
    print(printString);
  }

  //get iterator -
  //Returns an instance of the LinkedList iterator which knows how to traverse
  //the linkedlist structure. For use in foreach type calls.
  @override
  // DONE: implement iterator
  Iterator get iterator => _LLIterator(givenHead: head);
}

// _LinkedNode -
//Subclass for each node. Contains value and points to next node
class _LinkedNode<T> {
  T? val;
  _LinkedNode<T>? next;

  _LinkedNode({required T nodeVal}) {
    val = nodeVal;
  }
}

//_LLIterator -
//Subclass for LinkerList's iterator. Traverses the structure
class _LLIterator<T> implements Iterator<T> {
  int ndx = 0;
  _LinkedNode<T>? cur;

  _LLIterator({required _LinkedNode<T>? givenHead}) {
    cur = givenHead;
  }

  @override
  // DONE: implement current
  T get current {
    T? curVal = cur?.val;
    cur = cur?.next;
    return curVal as T;
  }

  @override
  bool moveNext() {
    // DONE: implement moveNext
    return cur != null;
  }
}
