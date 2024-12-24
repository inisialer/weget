// form2_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weget/bloc/form/form_bloc.dart';
import 'package:weget/helper/router_name.dart';

class Form2Page extends StatelessWidget {
  final List<TextEditingController> _controller3 = [TextEditingController()];

  Form2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form 2')),
      body: BlocBuilder<FormBloc, FormUpdateState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  children: List.generate(
                    _controller3.length,
                    (index) => TextField(
                      controller: _controller3[index],
                      decoration: const InputDecoration(labelText: 'Value 3'),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(form3);
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
