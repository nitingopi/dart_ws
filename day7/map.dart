class Person{
  static int lastId =  1;
  final _id = lastId++;
  String _name;

  Person(this._name);

  @override
  String toString()  => '{"id : $_id name : $_name"}';
  // {
    
  //   return "id : $_id name : $_name";
  // }
  
}

void main() {
  var list = [11,23,45];
  print(list);

  var sqrmap = list.map((e) => (e*e));
  print(sqrmap);

  var greatlist = ["Elon Musk", "Mark Zukerberg", "Bill Gates"];

  var great = greatlist.map((e) => Person(e));
  print(great);

  print(list.map((e) => {e:e*e}));

}