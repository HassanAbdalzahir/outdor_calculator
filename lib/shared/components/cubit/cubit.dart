import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outdor_calculator/modules/archived_tasks.dart';
import 'package:outdor_calculator/modules/message.dart';
import 'package:outdor_calculator/modules/new_tasks.dart';
import 'package:outdor_calculator/modules/user_details.dart';
import 'package:outdor_calculator/shared/components/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    // NewTasks(title: ''),
    // const InProgress(),
    // const Posted(),
    const ArchivedTasks(),
  ];
  List<String> titles = [
    'Tasks',
    'In Progress',
    'Posted',
    'Archived',
  ];
  // void changeBottomNavBar(int index) {

  // }
  List<Map> tasks = [];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  String email = '';
  String password = '';

  LoginSuccessState() {
    emit(LoginSuccessState());
  }

  LoginErrorState() {
    emit(LoginErrorState());
  }

  // late Database database;

  // void createDatabase() {
  //   database = openDatabase(
  //     'todo.db',
  //     version: 1,
  //     onCreate: (database, version) {
  //       print('database created');
  //       database
  //           .execute(
  //               'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
  //           .then((value) {
  //         print('table created');
  //       }).catchError((error) {
  //         print('error when creating table ${error.toString()}');
  //       }); // execute is used to create table
  //     },
  //     onOpen: (database) {
  //       getData FromDatabase(database).then((value) {
  //         tasks = value;
  //         print(tasks);
  //         emit(AppGetDatabaseState());
  //       });
  //       print('database opened');
  //     },
  //   ).then((value) {
  //     database = value;
  //     emit(AppCreateDatabaseState());
  //   }) as Database;
  // }

  // Future insertToDatabase({
  //   required String title,
  //   required String date,
  //   required String time,
  // }) async {
  //   return await database.transaction((txn) {
  //     txn
  //         .rawInsert(
  //             'INSERT INTO tasks (title, date, time, status) VALUES ("$title", "$date", "$time", "new")')
  //         .then((value) {
  //       print('${value} inserted successfully');
  //     }).catchError((error) {
  //       print('error when inserting new record ${error.toString()}');
  //     });
  //     return Future(() => 0);
  //   });
  // }

  // Future<List<Map>> getDataFromDatabase(database) async {
  //   return await database.rawQuery('SELECT * FROM tasks');
  // }
  // int currentIndex = 0;
  // List<Widget> bottomScreens = [
  //   HomeScreen(),
  //   CategoriesScreen(),
  //   FavoritesScreen(),
  //   SettingsScreen(),
  // ];

  // void changeBottom(int index) {
  //   currentIndex = index;
  //   emit(AppChangeBottomNavState());
  // }
}
