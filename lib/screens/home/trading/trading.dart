import 'package:flutter/material.dart';

class TradingScreen extends StatefulWidget {
  const TradingScreen({super.key});

  @override
  State<TradingScreen> createState() => _MarketState();
}

class _MarketState extends State<TradingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is Trading'),
    );
  }
}
