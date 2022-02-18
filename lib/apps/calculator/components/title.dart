import 'package:flutter/material.dart';

class IconTitle extends StatelessWidget {
  const IconTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.circle,
            size: 20,
            color: Colors.red[300],
          ),
          Icon(
            Icons.circle,
            size: 20,
            color: Colors.yellow[300],
          ),
          Icon(
            Icons.circle,
            size: 20,
            color: Colors.green[300],
          ),
        ],
      ),
    );
  }
}
