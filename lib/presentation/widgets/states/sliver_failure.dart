import 'package:flutter/material.dart';

class SliverFailure extends StatelessWidget {
  SliverFailure([this.message]);

  final String message;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
