import 'package:flutter/material.dart';
import 'package:login_register/Utilities/colors.dart';

class ErrorRefreshIcon extends StatelessWidget {
  ErrorRefreshIcon(
      {required this.onPressed, this.errorMessage, Key? key})
      : super(key: key);
  Function() onPressed;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Text(
              errorMessage?? "Error",
              style: TextStyle(
                color: button,
                letterSpacing: 1.5,
                fontSize: 20,
                fontFamily: 'Avenir',
              ),
            ),
            IconButton(
              splashColor: Colors.black,
              onPressed: onPressed,
              icon: Container(
                child: Center(child: Icon(Icons.refresh)),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            )
          ],
        ));
  }
}
