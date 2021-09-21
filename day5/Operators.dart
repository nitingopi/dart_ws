class Operator {
  var _value;
  Operator(this._value);

  operator >(Operator rhs) => this._value > rhs._value;

  operator <(Operator lhs) => this._value < lhs._value;

  // operator ==(Operator rhs) => this._value == rhs._value;
}

void main() {
  var ob1 = Operator(1);
  var ob2 = Operator(2);
  print(ob1 < ob2);
  print(ob1 > ob2);
}
