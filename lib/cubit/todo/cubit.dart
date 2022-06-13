import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/cubit/todo/appstates.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/Donetasks/dontasksscreen.dart';
import '../../model/archivetasks/archivetasksscreen.dart';
import '../../model/newtasks/newtasksscreen.dart';
import '../../network/remotly/local/sharedprafranced.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(Appinitstate());


  static AppCubit get(context) => BlocProvider.of(context);



  int currenindex=0;
  late Database database;
  List<Map> newtasks=[];
  List<Map> donetasks=[];
  List<Map> archivetasks=[];


  IconData iconedit=Icons.edit;
  bool isbottomsheetshow=false;





  List<Widget> screen=[
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];
  List<String> tittles=[
    "New tasks",
    "Done tasks",
    "Archive tasks",
  ];
  void getcurrentindex(index)
  {

    currenindex=index;
    emit(NavigationBottomAppBarstate());

  }
  void createDatabase()
  {
      openDatabase(
      "todo.db",
      version: 1,
      onCreate: (database,version){
        print("Data base is created");
        database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,data TEXT,time TEXT,status TEXT)')
            .then((value)
        {
          print("table is created");
        }).catchError((onError){
          print("error when youe creat table");
        });

      },
      onOpen: (database)
      {
        getDAtabaseFormTable(database);
        print("open data base ");
      },
    ).then((value)
    {
      database=value;
      emit(CreatDatabaseState());
    });
  }
  Future insetDatabase(
      {
        required String title,
        required String data,
        required String time,
      }
      ) async
  {
    return await database.transaction((txn) async
    {
      await txn.rawInsert('INSERT INTO TASKS(title,data,time,status) VALUES("$title","$data","$time","New")')
          .then((value){
        print ("$value insert is successed");
        emit(InsertDatabaseState());
        getDAtabaseFormTable(database);
      }).catchError((onError){print("erorr is caused when you insert ");});
    });
  }
  void getDAtabaseFormTable(database)
  {
    newtasks=[];
    donetasks=[];
    archivetasks=[];
    emit(GetDatabaseState());
     database.rawQuery('SELECT * FROM tasks').then((value) {
       print(value);
      value.forEach((element) {
        if(element['status']=='New')
          {
            newtasks.add(element);
          }else if(element['status']=='Done')
            {
              donetasks.add(element);
            }else
              {
                archivetasks.add(element);
              }
      });
      emit(GetDatabaseState());
    });
  }
  void UpdateDataBase({
  required String status,
    required int id,})
  {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]
    ).then((value)
    {
      emit(UpdateDatabaseState());
      getDAtabaseFormTable(database);
      emit(GetDatabaseState());
    });
  }

  void DeletDatabase({required int id,})
  {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value)
    {
      emit(DeleteDatabaseState());
      getDAtabaseFormTable(database);
      emit(GetDatabaseState());
    }
    );
  }


  void changeIconAndCloseSheet(
  {
  required IconData icond,
  required bool bottomclosesheet,
  })
  {
    iconedit=icond;
    isbottomsheetshow=bottomclosesheet;
    emit(changesheetstate());
  }




  bool isdark=true;

  void changemodeapp()
  {


          isdark = !isdark;
          CachHealper.PutBoolData(key: "key", value: isdark);
          emit(changemodestate());

  }
}