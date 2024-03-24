

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/screen/modules/todo/archive_tasks.dart';
import 'package:flutter_playground/screen/modules/todo/done_tasks.dart';
import 'package:flutter_playground/screen/modules/todo/new_tasks.dart';
import 'package:flutter_playground/screen/shared/bloc/todo/todo_states.dart';
import 'package:sqflite/sqflite.dart';

class TodoCubit extends Cubit<TodoStates> {

  TodoCubit(): super(InitState());

  static TodoCubit get(context)  => BlocProvider.of(context);
  late Database database;
  List<Map> newTasks = [];
  List<Map> archiveTasks = [];
  List<Map> doneTasks = [];
  int currentIndex = 0;
  List<String> titles = [
    "New Tasks",
    "Archive Tasks",
    "Done Tasks"
  ];

  List<Widget> screens = [
    const NewTasks(),
    const ArchiveTasks(),
    const DoneTasks()
  ];

  void changeCurrentIndex(int index)
  {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }

  // database
  void createDatabase()  {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        // id integer
        // title String
        // date String
        // time String
        // status String

        print('database created');
        database
            .execute(
            'CREATE TABLE todo (id INTEGER PRIMARY KEY, name TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getTodos(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
    });
 }

 void getTodos(Database database) {
    newTasks.clear();
    archiveTasks.clear();
    doneTasks.clear();
    
    database.rawQuery('SELECT * FROM todo')
             .then((value){
               for (var element in value) {
                 if(element['status'] == 'new') {
                   newTasks.add(element);
                 } else if (element['status'] == 'archive') {
                   archiveTasks.add(element);
                 } else {
                   doneTasks.add(element);
                 }
               }
               emit(GetTodos());
    });
 }

  Future<void> insertToDatabase(Database database, {required String name, required String time, required String date,}) async {
      await database.transaction((txn) async {
          try {
            final value = txn.rawInsert(
              'INSERT INTO todo(name, date, time, status) VALUES("$name", "$date", "$time", "new")',
            );
            print('$value Inserted');
            emit(InsertTodos());
            getTodos(database);
          } catch(error) {
            print('error is ${error.toString()}');
          }
    });
  }


  }
