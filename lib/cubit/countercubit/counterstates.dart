import 'package:noteappflutter/layout/counter.dart';

abstract class CounterStates {}


class CounterInitState extends CounterStates{}


class CounterMinusState extends CounterStates{
    int count;
  CounterMinusState(this.count);
}

class CounterPlussState extends CounterStates{
  int count;
  CounterPlussState(this.count);
}