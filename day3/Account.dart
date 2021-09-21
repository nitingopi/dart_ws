import 'dart:convert';

class Transaction{
  final DateTime date = DateTime.now();
  final String description;
  final double amount ;
  final String type;

  Transaction(this.description, this.amount, this.type);

  @override
  String toString() {
    
    String txn = "${this.date}: ${this.description} ${this.amount} ${this.type}";
    // return super.toString();
    return txn;
  }
}
class Account{
  //! FIELDS
  late final int accountNumber; //! PUBLICLY AVAILABLE AS READ-ONLY "PROPERTY"
  late String holdersName; // PUBLICLY AVAILABLE AS READ-ONLY "PROPERTY"
  late double _balance;  //! Private to the package
  var transactions = [];


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
  double deposit(String description, double amount) {
    var txn = Transaction(description, amount, "CR");
    transactions.add(txn);
    return _balance += amount;
    
    
  } 
  double withdraw(String description, double amount) {
    var txn = Transaction(description, amount, "DR");
    transactions.add(txn);
    return _balance -= amount;

  } 
  void display() => print("$accountNumber : [$holdersName] $_balance");

  
  //! GETTERS AND SETTERS
  double get balance => _balance; //# getter for private variables
 
  void printTransactions() {
    for (var txn in transactions) {
      // print("${txn.date}: ${txn.description} ${txn.amount} ${txn.type}");
      print(txn);
    }
  }

}

void main() {
  print(Account._nextAccountNumber);
  var a = Account("Lars Bak", 10000); 
  a.deposit("salary credited", 5000);
  a.withdraw("loan amount", 4000);
  a.printTransactions();
  

  print("----------------------------------");
 
  a.display();
  a.holdersName = "Mark Zuckerberg";
  a.display();
  print("Current balance ${a.balance}");
  print(Account.nextAccountNumber);

  var json = '{"holdersName":"Kasper" , "balance":1000.0}';
  var b = Account.fromJSON(json);
  b.display();

}