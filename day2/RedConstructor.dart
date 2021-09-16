class Employee{
  int id;
  String name;
  String dept;


  Employee(id, name) : this.withDept(id, name, "");

  Employee.newJoinee(this.id, this.name) : dept = "";

  Employee.withDept(this.id, this.name, this.dept);
}

void main() {
  var e1 = Employee
}