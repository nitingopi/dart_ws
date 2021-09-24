class Node<T>{
  T value;
  Node? next;

  Node(this.value);
}


class MyList<U>{
  Node? head;
  Node? tail;
  MyList();


  void add(U value) {
    var node = Node<U>(value);
    if (null == head){
      this.head = node;
      this.tail = node;
      
    }else{
      this.tail!.next = node;
      this.tail = node;

    }
    
  }

  void printForward(){
    for (var current = head; current != null; current = current.next){
      print(current.value);
    }
  }

  void printType(){
    print(head.runtimeType);
  }
}


void main() {
  var mylist = MyList<int>();
  mylist.add(1);
  mylist.add(2);
  mylist.printForward();
  mylist.printType();


  var secondlist = MyList<String>();
  secondlist.add("Apple");
  secondlist.add("Orange");
  secondlist.printForward();
  secondlist.printType();

  




}
