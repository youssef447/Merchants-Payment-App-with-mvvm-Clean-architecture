import 'package:flutter/material.dart';
import 'package:payment_application_1/Presentation/widgets/noHistory.dart';



class TransactionsHistory extends StatelessWidget {
  const TransactionsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your Transactions History",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const NoHistory(),
    );
  }
}
