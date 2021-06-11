import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/state/cubit/counter_cubit.dart';

class AppText extends StatefulWidget {
  @override
  _AppTextState createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Text(
            '${state.counterValue}' 
            ,
            style: Theme.of(context).textTheme.headline4,
          );
        },
      ),
    );
  }
}
