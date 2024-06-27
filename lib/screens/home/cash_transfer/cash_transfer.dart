import 'package:flutter/material.dart';

class CashTransferScreen extends StatefulWidget {
  const CashTransferScreen({super.key});

  @override
  State<CashTransferScreen> createState() => _MarketState();
}

class _MarketState extends State<CashTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is Cash'),
    );
  }
}
