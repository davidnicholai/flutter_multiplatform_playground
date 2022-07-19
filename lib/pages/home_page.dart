import 'package:flutter/material.dart';
import 'package:flutter_spike/pages/color_filter_page.dart';
import 'package:flutter_spike/widgets/custom_list_wheel_scroll_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _switchValue1 = false;
  bool _switchValue2 = false;
  bool _switchValue3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3333),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFF395B64),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16),
          _buildColumnTitles(),
          _buildDials(),
          _buildSwitches(),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ColorFilterPage();
              }));
            },
            child: const Text('Color Filters'),
          )
        ],
      ),
    );
  }

  Widget _buildColumnTitles() {
    Widget _buildText(String text) {
      return Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildText('ISO'),
        _buildText('F-number'),
        _buildText('Shutter speed'),
      ],
    );
  }

  Widget _buildDials() {
    Widget buildDial(List<String> options) {
      return SizedBox(
        width: 100,
        height: 100,
        child: CustomListWheelScrollView(
          children: options,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildDial(<String>['100', '250', '500', '1000']),
        buildDial(<String>['1.0', '2.5', '5.0', '10.0']),
        buildDial(<String>['1/1', '1/5', '1/10', '1/13'])
      ],
    );
  }

  Widget _buildSwitches() {
    Widget buildSwitch(bool switchValue, ValueChanged<bool> onChanged) {
      return Switch(
        value: switchValue,
        onChanged: onChanged,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildSwitch(
            _switchValue1, (val) => setState(() => _switchValue1 = val)),
        buildSwitch(
            _switchValue2, (val) => setState(() => _switchValue2 = val)),
        buildSwitch(
            _switchValue3, (val) => setState(() => _switchValue3 = val)),
      ],
    );
  }
}
