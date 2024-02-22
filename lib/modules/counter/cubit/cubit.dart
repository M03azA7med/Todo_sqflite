import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class CounterCubit extends Cubit<CounterSataes>
{
  CounterCubit() : super(InitialState());

  static CounterCubit get(context)=>BlocProvider.of(context);
  int Counter = 1;
  void minus(){
    Counter--;
  }
  void plus(){
    Counter++;
  }

}