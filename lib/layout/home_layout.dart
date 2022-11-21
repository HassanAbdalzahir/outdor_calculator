import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:outdor_calculator/modules/message.dart';
import 'package:outdor_calculator/shared/components/components.dart';
import 'package:outdor_calculator/shared/components/cubit/cubit.dart';
import 'package:outdor_calculator/shared/components/cubit/states.dart';
import '../modules/calculator.dart';
import '../modules/archived_tasks.dart';
import '../modules/user_details.dart';
import '../modules/new_tasks.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  HomeLayout({super.key});

  // @override
  // void initState() {
  //   super.initState();
  //   createDatabase();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(), //..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 47.0,
                          backgroundImage: AssetImage('images/murad.png'),
                        ),
                        // SizedBox(
                        //   height: 7.0,
                        // ),
                        Text(
                          'mohamed ahmed',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Sales@MuradAgency.com',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Account Settings'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Log Out'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            endDrawer: Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    child: null,
                  ),
                  ListTile(
                    leading: const Icon(Icons.aspect_ratio_sharp),
                    title: const Text('Outdoor Calculator'),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Calculator(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.list_alt_rounded),
                    title: const Text('Tasks'),
                    onTap: () {
                      // NewTasks();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.computer),
                    title: const Text('In Progress'),
                    onTap: () {
                      // const InProgress();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: const Text('Posted'),
                    onTap: () {
                      // const Posted();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.cloud_sync_outlined),
                    title: const Text('Archived'),
                    onTap: () {
                      const ArchivedTasks();
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: cubit.tasks.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : cubit.screens[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                      // insertToDatabase(
                      //   date: dateController.text,
                      //   time: timeController.text,
                      //   title: titleController.text,
                      // ).then((value) {
                      //   getFromDatabase(database).then((value) {
                      //     Navigator.pop(context);
                      //
                      //     setState(() {
                      //       isBottomSheetShown = false;
                      //       fabIcon = Icons.edit;
                      //
                      //       tasks = value;
                      //       print(tasks);
                      //     }
                      //     );
                      //   });
                      // });
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultFormField(
                                  controller: titleController,
                                  label: 'Task Title',
                                  prefix: Icons.title,
                                  type: TextInputType.text,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Title must not be empty';
                                    }
                                    return null;
                                  },
                                  onTap: () {
                                    print('title');
                                  },
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                defaultFormField(
                                  controller: timeController,
                                  label: 'Task Time',
                                  prefix: Icons.watch_later_outlined,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    // showTimPicker(
                                    //   context: context,
                                    //   initialTime: TimeOfDay.now(),
                                    // ).then(
                                    //   (value) {
                                    //     timeController.text =
                                    //         value!.format(context).toString();
                                    //     print(value.format(context));
                                    //   },
                                    // );
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter the time';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                defaultFormField(
                                  controller: dateController,
                                  label: 'Task Date',
                                  prefix: Icons.calendar_today,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2030-12-31'),
                                    ).then(
                                      (value) {
                                        dateController.text =
                                            (DateFormat.yMMMd().format(value!));
                                      },
                                    );
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter the date';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 20.0,
                      )
                      .closed
                      .then(
                    (value) {
                      isBottomSheetShown = false;
                      // setState(() {
                      //   fabIcon = Icons.edit;
                      // });
                    },
                  );

                  isBottomSheetShown = true;
                  // setState(
                  //   () {
                  //     fabIcon = Icons.add;
                  //   },
                  // );
                }
              },
              child: Icon(fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);

                // setState(
                //   () {
                //  currentIndex = index;
                //   },
                // );
              },
              items:  [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_rounded),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.computer),
                  label: 'In Progress',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Posted',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cloud_sync_outlined),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  //  Future<String> getName() async {
  //   return 'mohamed';
  // }
}
