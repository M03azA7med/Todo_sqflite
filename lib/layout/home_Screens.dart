
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_sqflite/modules/archiveTaskes/archiveTaskes.dart';
import 'package:todo_app_sqflite/modules/doneTaskes/doneTaskes.dart';
import 'package:todo_app_sqflite/modules/newTaskesScreen/new_taskes.dart';
import 'package:todo_app_sqflite/shared/components/components.dart';
import 'package:todo_app_sqflite/shared/components/constants.dart';
import 'package:todo_app_sqflite/shared/cubit/cubit.dart';
import 'package:todo_app_sqflite/shared/cubit/state.dart';

class homeScreens extends StatelessWidget {

  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datacontroller = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..createDb(),
      child: BlocConsumer<AppCubit,AppStates>(

        listener: (BuildContext context, AppStates state){
          if(state is AppinsertDbState)
          {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              leading: Icon(AppCubit.get(context).icon[AppCubit.get(context).crruntindex]),
              title: Text(AppCubit.get(context).title[AppCubit.get(context).crruntindex]),
            ),
            body: ConditionalBuilder(
              condition: true,
              builder: (context)=>AppCubit.get(context).Screens[AppCubit.get(context).crruntindex],
              fallback: (context)=>Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (AppCubit.get(context).bottomSheet)
                {
                  if (formKey.currentState!.validate())
                  {
                    AppCubit.get(context).insertDb(
                        title: titlecontroller.text,
                        data: datacontroller.text,
                        time: timecontroller.text);
                  }
                } else {
                  scaffoldKey.currentState!.showBottomSheet((context) =>
                      Container(
                        color: Colors.grey[100],
                        padding: EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: titlecontroller,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Title Must  Don\t be empty';
                                  }
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    label: Text('Title'),
                                    prefixIcon: Icon(Icons.title_sharp),
                                    border: OutlineInputBorder()

                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                controller: timecontroller,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Time Must  Don\t be empty';
                                  }
                                },
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime:TimeOfDay.now(),
                                  ).then((value) {
                                    timecontroller.text=value!.format(context).toString();
                                  });
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    label: Text('Time'),
                                    prefixIcon: Icon(Icons.watch_later_outlined),
                                    border: OutlineInputBorder()

                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                controller: datacontroller,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Data Must  Don\t be empty';
                                  }
                                },
                                onTap: (){
                                  showDatePicker(context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2030-06-01'),
                                  ).then((value) {
                                    datacontroller.text=DateFormat.yMMMd().format(value!);

                                  }
                                  );
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    label: Text('Data'),
                                    prefixIcon: Icon(Icons.calendar_month_outlined),
                                    border: OutlineInputBorder()

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ).closed.then((value) {
                    AppCubit.get(context).changebtnsheet(
                        issheet: false,
                        icon: Icons.edit);
                  });
                  AppCubit.get(context).changebtnsheet(
                      issheet: true,
                      icon: Icons.add);
                }
              },
              child: Icon (AppCubit.get(context).fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: AppCubit.get(context).crruntindex,
              onTap: (index) {
                AppCubit.get(context).changNavBar(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'New Taskes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.done_outline_rounded),
                  label: 'DoneTaskes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive),
                  label: 'ArchiveTaskes',
                ),
              ],
            ),
          );
        } ,
      ),
    );
  }

// to create and open data base

}

