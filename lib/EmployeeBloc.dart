/*

7 steps of bloc patern

1)imports
2)list of (Model) employees
3)Stream Controllers
4)Stream Sink getter
5)Constructors - add data; listen to change
6)Core functios
7)dispose -> calling up of all the streams and free up the resources , when every you are calling streams you are gethering up resources and you need to free them up
 */

import 'dart:async';

import 'Employee.dart';
import 'package:async/async.dart';


class EmployeeBloc{
  //sink to add in pipe
  //stream to get data from pipe
  //by pipe i mean data flow here


  List<Employee> _employeeList=[

    Employee(1,"Employee One",10000.0),
    Employee(2,"Employee Two",20000.0),
    Employee(3,"Employee Three",30000.0),
    Employee(4,"Employee Four",40000.0),
    Employee(5,"Employee Five",50000.0)


  ];


  //Controllers

  final _employeeListStreamController = StreamController<List<Employee>>();

//  we need stream controller for increment and decrement
      final _employeeSalaryIncrementStreamController = StreamController<Employee>();
      final _employeeSalaryDecrementStreamController = StreamController<Employee>();



      // getters
/*
KEEPING OUR NORMAL GETTER IN MIND WHICH WE CREATE IN MODEL

int get id{return this._id;}
  int = data type ,
  get = get keyword ,
  id = what is the thing  we want to get , and this is our method name also that we create
  return this.id= the thing we want to return

* */
//  we are using stream for output
/*Datatype here is Stream*/ Stream<List<Employee>> /* get keyword*/ get /* method name and the thing we want to get */ employeeListStream{ /* our return what we want to return */  return _employeeListStreamController.stream;}

  //Employee List ka input bhe to ana ha
  /* Datatype here is StreamSink */ StreamSink<List<Employee>> /* get keyword  */   /* method name and the thing we want to get */    get   /* method name and the thing we want to get */ employeeListSink{ /* our return what we want to return */   return _employeeListStreamController.sink; }

//   we are creating StreamSink for our increment and decrement also , because our increment and decremt are our two inputs

StreamSink<Employee> get employeeSalaryIncrement{return _employeeSalaryIncrementStreamController.sink;}

  StreamSink<Employee> get employeeSalaryDecrement{return _employeeSalaryDecrementStreamController.sink;}


//Now we are creating our constructor

EmployeeBloc(){
    _employeeListStreamController.add(_employeeList);
//    here we are listning to the changes

_employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
_employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
}







 _incrementSalary(Employee /* employee event*/employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20/100;
    _employeeList[employee.id-1].salary=salary + incrementedSalary;

 employeeListSink.add( _employeeList);//yehan sa list main input ate rehain ga
  }

   _decrementSalary(Employee /* employee event*/ employee) {

     double salary = employee.salary;
     double decrementedSalary = salary * 20/100;
     _employeeList[employee.id-1].salary=salary - decrementedSalary;

     employeeListSink.add( _employeeList);//yehan sa list main input ate rehain ga


   }


   void dispose(){
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeListStreamController.close();
   }


}