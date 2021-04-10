import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push App'),
      ),
      body: Container(
        child: Center(
          child: Text('Push App'),
        ),
      ),
    );
  }
}
