import 'dart:convert';

import 'dart:mirrors';

mixin JSON {
  Map<String, dynamic> toJson() {

    //# Object has field value
    InstanceMirror instanceMirror = reflect(this);

    //# Class (does not have field values, only field info)
    ClassMirror classMirror = instanceMirror.type; //% Person or Employee or any other ....
    Iterable<DeclarationMirror> memberList = classMirror.declarations.values;

    Map<String, dynamic> outputJson = {};
    for (var member in memberList) {
      //# Filter out only fields not method
      if (member is VariableMirror) {
        //# Find the name of the field
        var key = MirrorSystem.getName(member.simpleName);
        //# Get the value from instance, not class
        var value = instanceMirror.getField(member.simpleName).reflectee;
        //# compose { "field" : value} 
        outputJson[key] = value;
      }
    }
    //# complete json
    return outputJson;
  }
}

class Person with JSON{ //! include toJson() from JSON mixin into the class
  final int id;
  String name;
  Person(this.id, this.name);
  void printFunc() {
    print("$id $name");
  }
}

class Employee with JSON{
  final int id;
  String name;
  double salary;

  Employee(this.id, this.name, this.salary);
}

class Account with JSON{
  int accountNumber = 1;
  String holdersName = "ABC";
  double balance = 100000;

  
}

void main() {
  var p = Person(1, "Lars Bak");
  p.printFunc();
  print(p);
  print(json.encode(p));

  var e = Employee(2, "Kasper", 200000);
  print(jsonEncode(e));

  print(jsonEncode(Account()));


}
