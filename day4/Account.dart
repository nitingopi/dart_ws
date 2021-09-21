import 'dart:convert';

class Transaction {
  final DateTime date = DateTime.now();
  final String description;
  final double amount;
  final String type;

  Transaction(this.description, this.amount, this.type);

  @override
  String toString() {
    String txn =
        "${this.date}: ${this.description} ${this.amount} ${this.type}";
    return txn;
  }
}

class Account {
  //! FIELDS
  late final int accountNumber; //! PUBLICLY AVAILABLE AS READ-ONLY "PROPERTY"
  late String holdersName; // PUBLICLY AVAILABLE AS READ-ONLY "PROPERTY"
  late double _balance; //! Private to the package
  var transactions = [];

  // STATIC
  static int _nextAccountNumber = 100;
  static get nextAccountNumber => _nextAccountNumber;

  // constructor default
  Account(this.holdersName, [this._balance = 0]) {
    accountNumber = _nextAccountNumber++;
    var txn = Transaction("Account Opened", this._balance, "Account Opened");
    transactions.add(txn);
    print(txn);
  }

  // constructor named
  Account.fromJSON(String str) {
    var fieldMap = jsonDecode(str);
    accountNumber = _nextAccountNumber++;
    holdersName = fieldMap["holdersName"];
    _balance = fieldMap["balance"];
  }

  //! methods
  double deposit(String description, double amount) {
    var txn = Transaction(description, amount, "CR");
    transactions.add(txn);
    print(txn);
    return _balance += amount;
  }

  double withdraw(String description, double amount) {
    var txn = Transaction(description, amount, "DR");
    transactions.add(txn);
    print(txn);
    return _balance -= amount;
  }

  void display() => print("$accountNumber : [$holdersName] $_balance");

  //! GETTERS AND SETTERS
  double get balance => _balance; //# getter for private variables

  void printTransactions() {
    for (var txn in transactions) {
      print(txn);
    }
  }
}

class SavingsAccount extends Account {
  double _minBalance = 2000;
  SavingsAccount(String holdersName, double balance)
      : super(holdersName, balance);

  @override
  double withdraw(String description, double amount) {
    if (amount > (_balance - _minBalance)) {
      print("Sorry! you don't have enough funds in your account to withdraw");
      return _balance;
    }
    return super.withdraw(description, amount);
  }
}

class CurrentAccount extends Account {
  double _creditLimit = 5000;
  CurrentAccount(String holdersName, double balance)
      : super(holdersName, balance);

  @override
  double withdraw(String description, double amount) {
    if ((_creditLimit + _balance) < amount) {
      print("Sorry you don't have enough balance");
      return _balance;
    }
    return super.withdraw(description, amount);
  }
}

void main() {
  // print(Account._nextAccountNumber);
  // var a = Account("Lars Bak", 10000);
  // a.deposit("salary credited", 5000);
  // a.withdraw("loan amount", 4000);
  // a.printTransactions();

  print("----------------------------------");

  // a.display();
  // a.holdersName = "Mark Zuckerberg";
  // a.display();
  // print("Current balance ${a.balance}");
  // print(Account.nextAccountNumber);

  // var json = '{"holdersName":"Kasper" , "balance":1000.0}';
  // var b = Account.fromJSON(json);
  // b.display();

  // var b = SavingsAccount("Bill Gates", 10000);
  // b.deposit("salary credited", 5000);
  // b.withdraw("loan amount", 4000);
  // b.withdraw("groceries", 12000);
  // b.printTransactions();

  var b = CurrentAccount("Bill Gates", 10000);
  b.deposit("salary credited", 5000);
  b.withdraw("loan amount", 4000);
  b.withdraw("groceries", 12000);
  b.withdraw("vacation", 4000);
  b.withdraw("marriage", 1);
}
