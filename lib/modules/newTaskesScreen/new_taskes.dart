import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_sqflite/shared/components/components.dart';
import 'package:todo_app_sqflite/shared/components/constants.dart';
import 'package:todo_app_sqflite/shared/cubit/cubit.dart';
import 'package:todo_app_sqflite/shared/cubit/state.dart';

class newTaskes extends StatelessWidget {
  const newTaskes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
       return tasksBuilder(tasks: AppCubit.get(context).newtaskes);
      },

    );
  }
}
