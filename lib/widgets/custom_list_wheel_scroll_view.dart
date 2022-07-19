import 'package:flutter/material.dart';

class CustomListWheelScrollView extends StatelessWidget {
  final List<String> children;

  const CustomListWheelScrollView({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: 20,
      diameterRatio: 1.2,
      useMagnifier: true,
      // magnification: 1.3,
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    return children
        .map((e) => Container(
              color: const Color(0xFFE7F6F2),
              alignment: Alignment.center,
              // width: 50,
              // height: 30,
              child: Text(e),
            ))
        .toList();
  }
}
