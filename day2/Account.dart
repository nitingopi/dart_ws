class Account{
  //! FIELDS
  int? accountNumber; //! This can be null
  String _holdersName; // This can not be null, private to package
  double balance;
  late int age; //! you will initialize it later

  //# THIS GIVES ERROR 
  // Account(id, name, bal){
  //   this.accountNumber = id;
  //   this.holdersName = name;
  //   this.balance = bal;
  // }

  //! USE FIELD INITIALIZER WHEN PARAMS ARE DIRECTLY ASSIGNED TO FIELDS
  Account(id, this._holdersName, this.balance, a){
    this.accountNumber = id; // THIS WORKED BECAUSE IT IS NULLABLE
  }

  //! MEMBER INITIALIZE WHEN YOU WANT TO DO SOME COMPUTATION BEFORE ASSIGNING TO FIELDS
  Account.named(int id, String name, double bal):
    this.accountNumber=id, 
    this._holdersName=name.toUpperCase(),
    this.balance= bal < 0 ? 0 : bal;


  double deposit(double amount){
    balance += amount;
    return balance;
  }  

  double withdraw(double amount){
    balance -= amount;
    return balance;
  }

  void display(){
    print("$accountNumber: [$_holdersName] $balance");
  }


  get accNumber => accountNumber;

  set holdersName(value) => _holdersName = value;

    

}

void main() {
  // var a = Account(1, "abc", null, 20); // gives error
  var a = Account(101, "abc", 10000, 20); 
  a.deposit(100);
  a.withdraw(200);
  a.display();
  a.holdersName = "Mark";
  a.display();
  print(a.accNumber);

}