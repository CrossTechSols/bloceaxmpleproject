import 'package:flutter/material.dart';
import 'Employee.dart';
import 'EmployeeBloc.dart';

class HomePage extends StatefulWidget {


/*
 
Things used for responsiveness

 Flexible
 MediaQuerry
 Expanded 
  
* */

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final EmployeeBloc _employeeBloc = EmployeeBloc();

  void dispose(){
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Employee") ,

      ),

      body:MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
        ),
        child:Container(
          child: StreamBuilder<List<Employee>>(

            stream: _employeeBloc.employeeListStream,
            builder: (BuildContext context , AsyncSnapshot<List<Employee>> snapshot)
            {
              //it is necassary to return some widget here or else it will give error
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder:(context , index  ){

                  return Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Card(
                      elevation: 5.0,
                      child: Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[

                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "${snapshot.data![index].id}.",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ) ,

                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Text(
                                      "${snapshot.data![index].name}.",
                                      style: TextStyle(fontSize: 18.0),
                                    ),

                                    Text(
                                      " Rs ${snapshot.data![index].salary}.",
                                      style: TextStyle(fontSize: 16.0),
                                    ),



                                  ],
                                ),
                              ),
                            ) ,

                            Expanded(
                              child: Container(
                                child: IconButton(
                                  icon: Icon(Icons.thumb_up), onPressed: () {
                                  _employeeBloc.employeeSalaryIncrement.add(/* every thing happens in and out using this snapshot */snapshot.data![index]);
                                },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: IconButton(
                                  icon: Icon(Icons.thumb_down), onPressed: () {
                                  _employeeBloc.employeeSalaryDecrement.add(/* every thing happens in and out using this snapshot */ snapshot.data![index] );
                                },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      ,
                    ),
                  );
                } ,
              );
            }
            ,
          ),
        ),


      )

    );
  }
}
