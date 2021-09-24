import 'dart:convert';

//! STEP 1
typedef void Callback(double oldBalance, double newBalance, String type);

void onChange(double oldBalance, double newBalance, String type) {
  print(
      "Old balance => $oldBalance New Balance => $newBalance Transaction type => $type");
}

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

  //! STEP 2
  Callback? onChange = null;

  operator <(rhs) => this._balance < rhs.balance;
  operator >(lhs) => this._balance > lhs.balance;

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

  //! STEP 4
  //! methods
  double deposit(String description, double amount) {
    var txn = Transaction(description, amount, "CR");
    transactions.add(txn);
    print(txn);
    if (onChange != null) {
      onChange!(_balance, _balance + amount, "CR");
    }
    return _balance += amount;
  }

  //! STEP 4
  double withdraw(String description, double amount) {
    var txn = Transaction(description, amount, "DR");
    transactions.add(txn);
    print(txn);
    if (onChange != null) {
      onChange!(_balance, _balance - amount, "DR");
    }
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

  //! STEP 3 RECEIVE CALL BACK FROM USER
  void notifyMe(Callback onChange) {
    this.onChange = onChange;
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
  var b = CurrentAccount("Bill Gates", 100000);
  //! STEP 5
  // b.notifyMe(onChange);
  b.notifyMe((double oldBalance, double newBalance, String type) => print(
      "Old balance => $oldBalance New Balance => $newBalance Transaction type => $type"));
  b.deposit("salary credited", 5000);
  b.withdraw("loan amount", 4000);
  b.withdraw("groceries", 12000);
  b.withdraw("vacation", 4000);
  b.withdraw("marriage", 1);
}
