abstract class Collection<T> {
  Collection<T> add(T val); //Returns the receiver with new addition
  Collection<T> copy(); //Returns a copy of the receiver
  T operator []();
}
