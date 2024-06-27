import 'package:flutter/material.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({super.key});

  @override
  State<AssetsScreen> createState() => _MarketState();
}

class _MarketState extends State<AssetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is Asset'),
    );
  }
}
