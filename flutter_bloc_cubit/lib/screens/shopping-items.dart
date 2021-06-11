import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/state/cubit/counter_cubit.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: BlocProvider.of<CounterCubit>(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: Center(
            child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Text(
            '${state.counterValue}' 
            ,
            style: Theme.of(context).textTheme.headline4,
          );
        },
      ),
         
        ),
      ),
    );
  }
}
