int add(int a, int b) {
  return a + b;
}

int optionalFn(int a, [int b = 0]) {
  return a + b;
}

int namedFn(int a, int b, {required String op , String sep = "n"}) {
  print("op $op, sep $sep");
  return a + b;
}

int namedFn2(int a, int b, {int op, String sep = ""}){
  return a + b;
}

void main() {
  print(add(3, 4));
  print(optionalFn(5));
  print(optionalFn(6, 7));
  print(namedFn(8, 9, op:"hello", sep:"\t"));
  print(namedFn2(10, 11, op:12, sep:"\r"));
}
