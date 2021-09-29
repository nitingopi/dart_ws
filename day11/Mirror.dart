import 'dart:io';
import 'dart:mirrors';

class Person{
  final int id;
  String name;
  Person(this.id, this.name);

  void printFunction(){
    print("id : $id name : $name");
  }

  
}



void main(){
  var p = Person(1, "Lars Bak");
  p.printFunction();

  //# Get ClassMirror of Person
  ClassMirror classMirror = reflectClass(Person);

  //# Get a list of All members in Person class
  Iterable<DeclarationMirror> memberList = classMirror.declarations.values;
  
  //#Iterate through every member
  for(var member in memberList){
    //# Check whether it is a fields or a method  
    if (member is VariableMirror){
      stdout.write("Field: ");
    }else{
      stdout.write("Method: ");
    }
    //# Extract name from Symbol (never minified)
    stdout.writeln(MirrorSystem.getName(member.simpleName));
  }

}