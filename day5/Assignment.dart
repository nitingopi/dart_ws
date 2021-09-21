class Account {
  void doYouHaveMoney() {
    print("I have money");
  }

  void doSomething() {
    print("doing from Account class");
  }
}

mixin Taxes {
  void payTaxes() {
    print("I can pay taxes");
  }

  void doSomething() {
    print("doing from mixin Taxes");
  }
}

class Music {
  void playGuitar() {}
  void doSomething() {}
}

class Me extends Account with Taxes implements Music {
  void playGuitar() {
    print("I can play guitar");
  }

  void doSomething() {
    print("doing from Music interface");
  }
}

void main() {
  var me = Me();
  me.doYouHaveMoney();
  me.payTaxes();
  me.playGuitar();
  me.doSomething();
}
