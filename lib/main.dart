import 'package:billionaireapp/add_money_button.dart';
import 'package:billionaireapp/balance_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double balance = 0;

  void buttonClicked() async {
    setState(() {
      balance += 500;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('balance', balance);

    print('Button clicked! Balance: $balance');
  }

  void loadBalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      balance = prefs.getDouble('balance') ?? 0;
    });
  }

  @override
  void initState() {
    loadBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Billionaire App!'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.blueGrey[700],
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BalanceView(
                balance: balance,
              ),
              AddMoneyButton(buttonClicked: buttonClicked),
            ],
          ),
        ),
      ),
    );
  }
}
