import 'package:flutter/material.dart';

import 'package:clima_calc/apps/calculator/components/title.dart';
import 'package:clima_calc/apps/calculator/buttons.dart';

class Calc extends StatelessWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const IconTitle(),
      ),
      body: const Buttons(),
    );
  }
}
