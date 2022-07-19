import 'package:flutter/material.dart';

class ColorFilterPage extends StatelessWidget {
  final options = <ColorFilterListItem>[
    const ColorFilterListItem(name: 'Blue', color: Colors.blue),
    const ColorFilterListItem(name: 'Red', color: Colors.red),
    const ColorFilterListItem(name: 'Yellow', color: Colors.yellow),
    const ColorFilterListItem(name: 'Pink', color: Colors.pink),
    const ColorFilterListItem(name: 'Green', color: Colors.green),
  ];

  ColorFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3333),
      appBar: AppBar(
        title: const Text('Color Filters Page'),
        backgroundColor: const Color(0xFF395B64),
      ),
      body: ListView.separated(
        itemCount: options.length,
        separatorBuilder: (_, __) =>
            const Divider(height: 1, color: Colors.white54),
        itemBuilder: (BuildContext context, int index) {
          final item = options[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 12),
                Container(
                  width: 10,
                  height: 10,
                  color: item.color,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ColorFilterListItem {
  final String name;
  final Color color;

  const ColorFilterListItem({required this.name, required this.color});
}
