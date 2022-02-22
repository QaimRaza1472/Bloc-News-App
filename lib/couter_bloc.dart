import 'dart:async';
import 'package:flutter/material.dart';





/*
enum CounterEvent{
  Increment,
  Decrement,
  Reset,
}
*/


/*
class CounterBloc extends Bloc <CounterEvent,int>{






}
*/
//////////////////////////////////////////////////////////////////////////////////////////



enum CounterAction{
  Increment,
  Decrement,
  Reset,
}


class CounterBloc {
  int counter;

  final _stateStreamController= StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream =>_stateStreamController.stream;




  final _eventStreamController =StreamController<CounterAction> ();
  StreamSink<CounterAction> get eventSink =>_eventStreamController.sink;
  Stream <CounterAction> get eventStream =>_eventStreamController.stream;

  CounterBloc (){
    counter = 0;
    eventStream.listen((event) {
      if(event==CounterAction.Increment)
        counter++;
      else if (event==CounterAction.Decrement)
        counter--;
      else if (event==CounterAction.Reset)
        counter=0;
      counterSink.add(counter);

    }
    );
  }


  void dispose(){
    _stateStreamController.close();
    _eventStreamController.close();
  }




}












