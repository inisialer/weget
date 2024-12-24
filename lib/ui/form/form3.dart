// form3_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weget/bloc/form/form_bloc.dart';
import 'package:weget/helper/router_name.dart';

class Form3Page extends StatelessWidget {
  const Form3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form 3')),
      body: BlocBuilder<FormBloc, FormUpdateState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Value 1: ${state.value1}'),
                Text('Value 2: ${state.value2}'),
                Text('Value 3: ${state.value3}'),
                Text('Value 4: ${state.value4}'),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(form1);
                  },
                  child: const Text('Go to Form 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(form2);

                    Navigator.pushNamed(context, '/form2');
                  },
                  child: const Text('Go to Form 2'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
