import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin')),
      body: Center(child: Text('Admin Screen', style: TextStyle(fontSize: 24))),
    );
  }
}