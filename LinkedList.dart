import 'dart:io';

import 'Collection.dart';

class LinkedList<T extends Comparable> extends Collection {
  _LinkedNode<Comparable>? head;
  _LinkedNode<Comparable>? tail;

  // DONE: implement add
  @override
  Collection<Comparable> add(Comparable givenVal) {
    //Create new node to attach
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
  LinkedList<T> copy() {
    // DONE: implement copy
    LinkedList<T> copyList = new LinkedList<T>();
    for (var element in this) {
      copyList.add(element);
    }
    return copyList;
  }

  @override
  T operator [](int index) {
    // DONE: implement []
    if (index >= this.getSize()) {
      //If value is outside our size, throw error
      throw IndexError(index, this);
    }
    int ndx = 0;
    _LinkedNode<Comparable>? traverser = head;
    while (ndx < index) {
      traverser = traverser?.next;
      ndx += 1;
    }
    return traverser?.val as T;
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

  @override
  // DONE: implement iterator
  Iterator get iterator => _LLIterator(head);
}

class _LinkedNode<T extends Comparable> {
  T? val;
  _LinkedNode<T>? next;

  _LinkedNode(T givenVal) {
    val = givenVal;
  }
}

class _LLIterator<T extends Comparable> implements Iterator<T> {
  int ndx = 0;
  _LinkedNode<T>? cur;

  _LLIterator(_LinkedNode<T>? givenHead) {
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
