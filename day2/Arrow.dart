int sqr(int x) {
  return x * x;
}

int arrow(int x) => x * x;

void main() {
  var result = sqr(5);
  print(result);
  result = arrow(6);
  print(result);
}
