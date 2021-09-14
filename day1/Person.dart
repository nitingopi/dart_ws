//% Class contains
//% 1.Fields
//% 2.Methods
//% 3.Operators
//% 4.static
//! There are no public, protected or private keywords in dart

class Person{

  int id = 0;
  String name = "Kasper";

  // Person(int id, String name){
  //   this.id = id;
  //   this.name = name;
  // }

  // Person(int id, String name):this.id = id, this.name = name;

  
  Person(this.id, this.name);

  // Person(this.id, {this.name= "Bak"});

  //% named constructor
  Person.fromString(String str){
    print("Got $str");
  }

  Person.fromJSON(String str){
    print("Got $str");
  }

  Person.fromXML(String str){
    print("Got $str");
    print("$id $name");
  }

  void printPerson(){
    print("$id $name");
  }
}
String movie = "James Bond";
void main(){
  var p = Person(1, "Bill");
  var p1 = Person(2, 23);
  p.printPerson();
  p1.printPerson();
  print(movie);

  var q = Person.fromJSON("{'id':1, 'name='Hari'}");
  q.printPerson();

  var r = Person.fromXML("<Person><id>2</id><name>Kairali</name></Person>");
  r.printPerson();

  var s = Person.fromString("id=4, name=Manoj");
  s.printPerson();

}


