import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String errorMessage;
  AppError(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: errorMessage.isNotEmpty,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          errorMessage,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
