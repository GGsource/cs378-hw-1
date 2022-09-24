import 'dart:io';

import 'Collection.dart';

class LinkedList<T extends Comparable> extends Collection {
  _LinkedNode<Comparable>? head;
  _LinkedNode<Comparable>? tail;

  // DONE: implement add
  @override
  Collection<Comparable> add(Comparable givenVal) {
    //Create Traverser node in order to leave head unaffected
    print("adding $givenVal to list...");
    print("head is currently ${head?.val}");
    //Attach a new node with our given value at the end
    _LinkedNode newNode = new _LinkedNode(givenVal);
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

  @override
  Collection<T> copy() {
    // TODO: implement copy
    throw UnimplementedError();
  }

  @override
  T operator [](int index) {
    // TODO: implement []
    throw UnimplementedError();
  }

  @override
  void printString() {
    // TODO: implement printString
    stdout.write("-[");
    _LinkedNode<Comparable>? traverser = head;
    while (traverser != null) {
      stdout.write("${traverser.val}");
      if (traverser.next != null) {
        stdout.write(", ");
      }
      traverser = traverser.next;
    }
    stdout.write("]-\n");
  }
}

class _LinkedNode<T extends Comparable> {
  T? val;
  _LinkedNode<T>? next;

  _LinkedNode(T givenVal) {
    val = givenVal;
  }
}
