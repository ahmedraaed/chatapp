import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/cubit/countercubit/counterstates.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit():super(CounterInitState());

  static CounterCubit get(context)=>BlocProvider.of(context);

  int count=0;


  void minus()
  {
    count--;
    emit(CounterMinusState(count));

  }

  void pluss()
  {
    count++;
    emit(CounterPlussState(count));
  }

}