import 'package:flutter/material.dart';
import 'package:login_register/Utilities/colors.dart';

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        child: CircularProgressIndicator(
          color: primary,
          strokeWidth: 4,
        ),
        constraints: const BoxConstraints.tightFor(height: 50, width: 50),
      ),
    );
  }
}
