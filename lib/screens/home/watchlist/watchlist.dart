import 'package:flutter/material.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistState();
}

class _WatchlistState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is Watchlist'),
    );
  }
}
