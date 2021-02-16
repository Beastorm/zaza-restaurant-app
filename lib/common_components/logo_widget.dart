import 'package:flutter/material.dart';

class LogoWidgets extends StatelessWidget {
  const LogoWidgets({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
        Transform.translate(
          offset: Offset(0, -10),
          child: Text(
            "",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    ));
  }
}
