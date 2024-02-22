import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_sqflite/modules/archiveTaskes/archiveTaskes.dart';
import 'package:todo_app_sqflite/modules/newTaskesScreen/new_taskes.dart';

import '../../modules/doneTaskes/doneTaskes.dart';
import 'state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
// to ge instace
  static AppCubit get(context)=>BlocProvider.of(context);

  int crruntindex = 0;
  List<Widget> Screens = [
    newTaskes(),
    doneTaskes(),
    archiveTaskes(),
  ];
  List<String> title = [
    'New Taskes',
    'Done Taskes',
    'Archive Taskes ',
  ];
  List<IconData> icon = [
    Icons.add_task,
    Icons.done_all_sharp,
    Icons.archive_outlined
  ];
  late Database database;
  List<Map> newtaskes=[];
  List<Map> donetaskes=[];
  List<Map> archivetaskes=[];
  IconData fabIcon = Icons.edit;
  bool bottomSheet = false;
  void changNavBar(int index)
  {
    crruntindex=index;
    emit(AppchangeNavBarState());

  }

// 1- create data
  void createDb()  {
     openDatabase('todo.db', version: 1,
        onCreate: (database, version) {
          print('database created');
          database
              .execute(
              'CREATE TABLE taskes (id INTEGER PRIMARY KEY, title  TEXT, data  TEXT,time TEXT,status TEXR)')
              .then((value) {
            print('table is created');
          }).catchError((error) {
            print('error is ${error.toString()}');
          });
        },
        onOpen: (database) {
          print('database is opened');
          getRecord(database);
        }).then((value) {
          database=value;
          emit(AppcreateDbState());
     });
  }

//2- to insert recored in data base

   insertDb({
    required String title,
    required String data ,
    required String time ,})async {
    await database.transaction((txn) {
      txn
          .rawInsert(
        'INSERT INTO taskes (title,data,time,status) VALUES("$title","$data","$time","new")',
      )
          .then((value) {
        print('$value insert done');
        emit(AppinsertDbState());
        getRecord(database);
      }).catchError((error) {
        print('error is ${error.toString()}');
      });
      return Future(() => null);
    });
  }

//3- to udpate in data
  void updateData({
    required String status,
    required int id,
  }) async
  {
    database.rawUpdate(
      'UPDATE taskes SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value)
    {
      getRecord(database);
      emit(AppupdateDbState());
    });
  }

// 4- to delete data
  void deletData({

    required int id,
  }) async {
    database.rawDelete('DELETE FROM taskes WHERE id = ?', [id]).then((value)
    {
      getRecord(database);
      emit(AppupdateDbState());
    });
  }

//5-  to get data
  void getRecord(database)
  {
    newtaskes=[];
    archivetaskes=[];
    donetaskes=[];

     database.rawQuery('SELECT * FROM taskes').then((value) {
       value.forEach((element) {
         if(element['status']=='new'){
           newtaskes.add(element);
         }else if(element['status']=='done') {
           donetaskes.add(element);
         }else
           archivetaskes.add(element);
      });
       emit(AppgetDbState());
     });
  }


  void changebtnsheet(
  {
    required bool issheet,
    required IconData icon,})
  {
    emit(AppchangebtnSheetState());
    bottomSheet=issheet;
    fabIcon=icon;
  }


}