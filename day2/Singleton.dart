class Singleton{
  static Singleton? obj; //# this obj can be null
  Singleton.internal (){

  }

  factory Singleton(){
    if (obj == null){
      obj = Singleton.internal();
    }
    return obj!; //# !-> guarantee that obj is not null
  }
}

void main() {
  var s1 = Singleton();
  var s2 = Singleton();
  print(s1 == s2);
}