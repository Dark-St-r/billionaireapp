import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceView extends StatelessWidget {
  const BalanceView({super.key, required this.balance});

  final double balance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Balance part'),
          const SizedBox(height: 20),
          Text(
            '\$ ${NumberFormat.simpleCurrency(name: '').format(balance)}',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
