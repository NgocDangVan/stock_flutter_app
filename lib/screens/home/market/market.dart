import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketState();
}

class _MarketState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is market'),
    );
  }
}
