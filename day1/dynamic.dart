dynamic foo(dynamic a, dynamic b){
  return a+b;

}



void main() {
  dynamic sum = foo(2,"3.14");
  print(sum);
}