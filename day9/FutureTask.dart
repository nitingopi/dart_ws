Future<int> fetchData() {
  return Future.delayed(
    Duration(seconds: 5),
    // () => Future.value(100),
    () => throw new Exception("Error!"),
  );
}

void main() {
  //# fetchData will return a token (deferred)
  print("Calling govt office");
  var deferred = fetchData();

  //# We will get a phone call (.then()) when it is done
  print("He promises to call us back with result");
  deferred
      .then((result) => print("Future returned $result"))
      .catchError((error) => print("Govt officer said No! there is an $error"));

  //# we will continue with our life, not holding the phone for 2 hours
  print("I am continuing doing something else");
  var list = [1, 2, 3];
  print(list.map((element) => element * element));
  print("Program ends");
}
