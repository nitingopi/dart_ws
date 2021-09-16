import 'dart:convert';

class Account{
  //! FIELDS
  late final int accountNumber; //! PUBLICLY AVAILABLE AS READ-ONLY "PROPERTY"
  late String holdersName; // PUBLICLY AVAILABLE AS READ-ONLY "PROPERTY"
  late double _balance;  //! Private to the package


  // STATIC 
  static int _nextAccountNumber = 100;
  static get nextAccountNumber => _nextAccountNumber;

  // constructor default
  Account(this.holdersName, [this._balance=0]) : accountNumber = _nextAccountNumber++ ;     

  // constructor named
  Account.fromJSON(String str){
    var fieldMap = jsonDecode(str);
    accountNumber = _nextAccountNumber++;
    holdersName = fieldMap["holdersName"];
    _balance = fieldMap["balance"];
  }

  //! methods
  double deposit(double amount) => _balance += amount;
  double withdraw(double amount) => _balance -= amount;
  void display() => print("$accountNumber : [$holdersName] $_balance");

  
  //! GETTERS AND SETTERS
  double get balance => _balance; //# getter for private variables

}

void main() {
  print(Account._nextAccountNumber);
  var a = Account("Lars Bak", 10000); 
  a.deposit(100);
  a.withdraw(200);
  a.display();
  a.holdersName = "Mark Zuckerberg";
  a.display();
  print("Current balance ${a.balance}");
  print(Account.nextAccountNumber);

  var json = '{"holdersName":"Kasper" , "balance":1000.0}';
  var b = Account.fromJSON(json);
  b.display();

}