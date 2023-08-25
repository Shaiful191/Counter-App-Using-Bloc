import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocapp/app_blocs.dart';
import 'package:flutterblocapp/app_event.dart';
import 'package:flutterblocapp/app_states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppBlocs(),
      child:  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: CounterHome(),
      ),
    );


  }
}

class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App Using Bloc "),centerTitle: true,),

      body: Center(
        child: BlocBuilder<AppBlocs,AppStates>(
          builder: (context,state){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You have pushed the button this many times:",style: TextStyle(fontSize: 20),),
                Text("${BlocProvider.of<AppBlocs>(context).state.counter}",
                style: Theme.of(context).textTheme.headlineMedium,
                )


              ],
            );
          },
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
              onPressed: ()=>BlocProvider.of<AppBlocs>(context).add(Increment()),
              child: Icon(Icons.add),
          ),
          FloatingActionButton(
              onPressed: ()=>BlocProvider.of<AppBlocs>(context).add(Decrement()),
              child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}


