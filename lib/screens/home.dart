import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Navigation'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/clima'),
                child: const Text('Clima App'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/calc'),
                child: const Text('Calculator'),
              ),
            ],
          ),
        ));
  }
}
