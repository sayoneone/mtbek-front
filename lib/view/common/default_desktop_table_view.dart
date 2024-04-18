import 'package:flutter/material.dart';

class DefaultDesktopTableView extends StatelessWidget {
  const DefaultDesktopTableView({
    super.key,
    required this.titles,
    required this.items,
  });

  final List<String> titles;
  final List<List<dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Table(
        children: [
          TableRow(
            children: [
              for (var title in titles)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  child: Text(
                    title,
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          for (var item in items)
            TableRow(
              children: [
                for (var value in item)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    child: Text(
                      value.toString(),
                      softWrap: true,
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
