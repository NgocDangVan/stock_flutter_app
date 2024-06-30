import 'package:flutter/material.dart';
import 'package:infinite_scroll_tab_view/infinite_scroll_tab_view.dart';
import 'package:stock_app/screens/home/market/industry/industry.dart';
import 'package:stock_app/screens/home/market/stock_market/stock_market.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketState();
}

class _MarketState extends State<MarketScreen> {
  final List<String> categories = [
    'Stock Market',
    'Industry',
    'Index',
    'Derivatives',
    'Cover Warrants',
    'ETF',
    'Top Stock',
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InfiniteScrollTabView(
        contentLength: categories.length,
        onTabTap: (index) {
          debugPrint('You tapped: $index');
        },
        tabBuilder: (index, isSelected) => Text(
          categories[index],
          style: TextStyle(
              color: isSelected ? Colors.pink : Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        pageBuilder: (context, index, _) {
          if (index == 0) {
            return StockMarket();
          } else if (index == 1) {
            return Industry();
          }
          return Text('Ha ha');
        },
      ),
    );
  }
}
