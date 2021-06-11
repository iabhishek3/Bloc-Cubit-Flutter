import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/screens/shopping-items.dart';
import 'package:flutter_bloc_cubit/state/cubit/counter_cubit.dart';
import 'package:flutter_bloc_cubit/widgets/app-text.dart';
import 'package:badges/badges.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Cubit Example')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        //  IconButton(
        //     icon: const Icon(Icons.add_shopping_cart),
        //     tooltip: 'Show Snackbar',
        //     onPressed: () {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //           const SnackBar(content: Text('This is a snackbar')));
        //     },
        //   ),
        BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return ElevatedButton(
              
              child: Container(
                margin: const EdgeInsets.only(right: 15, top: 5),
                child: Badge(
                  badgeContent: Text(state.counterValue.toString()),
                  child: Icon(Icons.add_shopping_cart),
                  
                ),

                
              ),
              onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingList()),
            );
          },
            );
          },
        )
      ]),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          var typofClick = state.wasIncremented ? "Incraement" : "Dcrement";

          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(typofClick),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          ));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   'You have pushed the button this many times:',
              // ),
              AppText(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                      heroTag: "btn1",
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                      heroTag: "btn2",
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.remove),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     BlocProvider.of<CounterCubit>(context).increment();
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
