import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteappflutter/cubit/todo/appstates.dart';
import 'package:noteappflutter/cubit/todo/cubit.dart';
import 'package:noteappflutter/model/Donetasks/dontasksscreen.dart';
import 'package:noteappflutter/model/newtasks/newtasksscreen.dart';
import 'package:sqflite/sqflite.dart';

import '../model/archivetasks/archivetasksscreen.dart';
import '../sharecomponent/contant.dart';
import '../sharecomponent/sharecomponent.dart';



class HomeScreen extends StatelessWidget {


  TextEditingController titlecontroller=TextEditingController();
  TextEditingController timecontroller=TextEditingController();
  TextEditingController datecontroller=TextEditingController();

  var scafoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) {
          if(state is InsertDatabaseState)
            {
              Navigator.pop(context);

            }
        },
        builder: (BuildContext context, Object? state) {
          AppCubit cubit=AppCubit.get(context);
          return  Scaffold(
            key: scafoldkey,
            appBar: AppBar(
              title: Text(
                cubit.tittles[cubit.currenindex],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            body:cubit.screen[cubit.currenindex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if(cubit.isbottomsheetshow)
                {
                  if(formkey.currentState!.validate())
                  {
                    cubit.insetDatabase(
                      title: titlecontroller.text,
                      data: datecontroller.text,
                      time: timecontroller.text,).then((value) {
                      cubit.changeIconAndCloseSheet(icond: Icons.edit, bottomclosesheet: false);
                    });
                  }
                }
                else
                {
                  cubit.changeIconAndCloseSheet(icond: Icons.add, bottomclosesheet: true);

                  scafoldkey.currentState!.showBottomSheet((context)
                  {
                    return Container(
                      color: Colors.lightBlueAccent[100],
                      padding: EdgeInsets.all(20),
                      child:Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty)
                                {
                                  return "enter the title";
                                }
                                return null;
                              },
                              controller: titlecontroller ,
                              decoration:InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Title",
                                prefixIcon: Icon(Icons.title),


                              ) ,
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              onTap: () {
                                showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value)
                                {
                                  timecontroller.text=value!.format(context).toString();
                                });
                              },
                              keyboardType: TextInputType.number,
                              controller: timecontroller ,
                              decoration:InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:"Time",
                                prefixIcon: Icon(Icons.lock_clock),
                              ) ,
                              validator: (value) {
                                if (value!.isEmpty)
                                {
                                  return "enter the time";
                                }
                                return null;
                              },



                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              onTap: () {
                                showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.parse('2025-02-30'),)
                                    .then((value)
                                {
                                  print(DateFormat.yMd().format(value!));
                                  datecontroller.text=DateFormat.yMd().format(value);
                                });
                              },
                              keyboardType: TextInputType.number,
                              controller: datecontroller ,
                              decoration:InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:"date",
                                prefixIcon: Icon(Icons.calendar_today),
                              ) ,
                              validator: (value) {
                                if (value!.isEmpty)
                                {
                                  return "enter the time";
                                }
                                return null;
                              },



                            ),

                          ],
                        ),
                      ) ,

                    );
                  }).closed.then((value)
                  {
                    cubit.changeIconAndCloseSheet(icond: Icons.edit, bottomclosesheet: false);

                  });
                }

                //  insetDatabase();
              },
              child: Icon(cubit.iconedit),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currenindex,
              onTap: (index){

                   cubit.getcurrentindex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance),
                  label: "Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: "Done",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive),
                  label: "Archive",
                ),

              ],
            ),
          );
        },

      ),
    );
  }





















//   void createDatabase()async
//   {
//      database= await openDatabase(
//       "todo.db",
//       version: 1,
//       onCreate: (database,version){
//         print("Data base is created");
//         database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,data TEXT,time TEXT,status TEXT)')
//             .then((value)
//         {
//           print("table is created");
//         }).catchError((onError){
//           print("error when youe creat table");
//         });
//
//       },
//       onOpen: (database)
//     {
//       getDAtabaseFormTable(database).then((value) {
//         tasks=value;
//         print("table has many of value this value is     *******:*******         $tasks");
//
//       });
//       print("open data base ");
//     },
//     );
//   }
//
//   Future insetDatabase(
//   {
//   required String title,
//     required String data,
//     required String time,
// }
//       ) async
//   {
//       return await database.transaction((txn) async
//     {
//        await txn.rawInsert('INSERT INTO TASKS(title,data,time,status) VALUES("$title","$data","$time","New")')
//           .then((value){
//             print ("$value insert is successed");
//       }).catchError((onError){print("erorr is caused when you insert ");});
//     });
//   }
//   Future<List<Map>> getDAtabaseFormTable(database)async
//   {
//     return await database.rawQuery('SELECT * FROM tasks');
//   }
}

