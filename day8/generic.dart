class MyType<T>{

  T _value;
  MyType(this._value);

  void printValue(){
    print("value $_value");
    
  }
}


void main(){
  var a = MyType<int>(4);
  a.printValue();

  var b = MyType("helo");
  b.printValue();
  print(b.runtimeType);

  var c = MyType(3.14);
  c.printValue();


  print(c.runtimeType);


  var d = MyType<dynamic>('kuch bhi');
  d.printValue();

  print(a);
  print(c);

  List<int> list = [1,2,3];
  list.add(4);
  print(list.runtimeType);


  List list1 = [];
  list1.add("apple");
  list1.add(3.14);

  var typeList1 = list1.runtimeType;
  print("Type of list1 := $typeList1");

  List<Object> list2 = [];
  list2.add(4);
  list2.add("helow world");
  list2.add({"id":1, "name":"Bond"});
  print(list2);
  var typeList2 = list2.runtimeType;
  print("Type of list2 => $typeList2");
  list2.



}