import 'package:bloc/NewsBloc/news_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'couter_bloc.dart';

void main() {
  runApp( MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,),
      //home:  const MyHomePage(title: 'Flutter Demo Home Page',),
      home: const NewsPage(),
     // home: TestingCounter(),
    );
  }
}






//////////////////////////////////////////   Counter App With Bloc    //////////////////////
class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key key,  this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   final counterBloc = CounterBloc();


   @override
   void dispose(){
     counterBloc.dispose();
     super.dispose();
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: counterBloc.counterStream,
              initialData: 0,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return Text(
                    '${snapshot.data}',
                   // style: Theme.of(context).textTheme.headline4,
                  );
                }

                if(snapshot.hasError){
                  print("-------------Snapshot has error---------");
                  print(snapshot.hasError);
                  print("-------------Snapshot has error---------");
                }
              },
            ),
          ],
        ),
      ),



      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed:
            () {
              counterBloc.eventSink.add(CounterAction.Increment);
              },
            tooltip: 'Increment',
            child:  const Icon(Icons.add),
          ),
          const SizedBox(height: 3,),
          FloatingActionButton(
            heroTag: "2",
            onPressed:
            (){
              counterBloc.eventSink.add(CounterAction.Decrement);
            },
            tooltip: 'Increment',
            child:  const Icon(Icons.remove),
          ),
          const SizedBox(height: 3,),
          FloatingActionButton(
            heroTag: "3",
            onPressed:  (){
              counterBloc.eventSink.add(CounterAction.Reset);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.loop),
          ),
        ],
      ),
    );
  }


}





