//%classes vs interfaces


//% Dart has overriding but not overloading
class Base{
  int id;
  Base() : id = 8;
  void printId()=>print(id);
}

class Derived extends Base{

  @override
  void printId()=>print("id=$id");
}

void main() {
  var b = Base();
  b.printId();

  var d = Derived();
  d.printId();

  //! Base class does not define behaviour
  //! Derived class defines how exactly it will happen
  Base bp = Derived();
  bp.printId(); //% Polymorphism
}