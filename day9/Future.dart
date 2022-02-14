
import 'dart:io';

void callFuture(){
  print("Your future has been called");

  //# Passing a function for future to execute
  Future((){ //* Future is always crated in 'suspended' mode
    for (var i = 0; i < 12 ; i++){
      sleep(Duration(seconds: 1));
      print("Future $i");
    }
  });
}


void  main() {
  //# DEFERRED PROCESSING
  callFuture();
  for (var i = 0; i < 12; i++){
    sleep(Duration(seconds: 1));
    print("main $i");
  }
}