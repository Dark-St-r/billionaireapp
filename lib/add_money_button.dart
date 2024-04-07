import 'package:flutter/material.dart';

class AddMoneyButton extends StatelessWidget {
  const AddMoneyButton({super.key, required this.buttonClicked});

  final void Function() buttonClicked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[700],
            minimumSize: const Size(double.infinity, 0),
          ),
          onPressed: buttonClicked,
          child: const Text('Click here!')),
    );
  }
}
