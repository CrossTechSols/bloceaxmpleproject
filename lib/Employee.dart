import 'package:flutter/material.dart';
//this is employee model

class Employee{
  int _id;


  String _name;
  double _salary;



  Employee(this._id, this._name, this._salary);

  set id(int id){
    this._id=id;
  }

  set name(String name){
    this._name=name;
  }

  set salary(double salary){
    this._salary=salary;
  }


  int get id{return this._id;}
  double get salary{return this._salary;}
  String get name{return this._name;}






}