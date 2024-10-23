
import 'package:flutter/material.dart';

class ErrorResponseWidget extends StatefulWidget {
  final String message;
  const ErrorResponseWidget({super.key, required this.message});

  @override
  State<ErrorResponseWidget> createState() => _ErrorMessageWidgetState();
}

class _ErrorMessageWidgetState extends State<ErrorResponseWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Text(widget.message),
      ),
    );
  }
}
