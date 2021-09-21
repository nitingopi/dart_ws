void printFunc(element){print("Element $element");}
void main() {
  var list = [11,23,36];
  print(list);
  print(list[0]);
  print("*"*10);
  for (var val in list) {
    print("For in $val");
  }
  print("*"*10);
  list.forEach(printFunc);
  print("*"*10);
  list.forEach((element) {print("Anonymous $element");});
  print("*"*10);
  list.forEach((element) => print("Arrow $element"));
  print("*"*10);
  var result = list.every((element) => element > 10);
  print("every element > 10 $result");
  result  = list.any((element) => element > 20);
  print("any element > 20 $result");
  print(list.contains(23));

}