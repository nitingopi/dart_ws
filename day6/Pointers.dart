typedef void Callback(double newBalance);

class ATM{
  double _balance;

  Callback? mobileNumber  = null;

  ATM(this._balance);

  void withdraw(double amount){
    _balance -= amount;

    if (mobileNumber != null) mobileNumber!(_balance);
  }


  void notifyMe(Callback mobileNumber){
    this.mobileNumber = mobileNumber;
  }
}



void myMobile(double amt){
  print("New balance is $amt");
}


void main(){
  var a = ATM(1000);

  a.notifyMe(myMobile);
  a.withdraw(100);
  a.withdraw(100);
}