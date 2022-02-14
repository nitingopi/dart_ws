import 'dart:io';
import 'dart:isolate';

//# this code will be put in a different isolate (its own heap, stack)
void backgroundTask(port){
  print("Isolate is running: " );
  for (var i = 0; i < 12; i++){
    sleep(Duration(seconds: 1));
    print("Isolate $i");
  }

  print("Isolate ends");
}

void main() {
  Isolate.spawn(backgroundTask, null);
  for (var i = 0; i < 12 ; i++) {
    sleep(Duration(seconds: 1));
    print("main $i");
  }
}