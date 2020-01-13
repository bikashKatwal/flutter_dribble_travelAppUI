import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _icons = <IconData>[
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  Widget _getIcons() {
    final iconWidget = <Widget>[];
    for (var i = 0; i < _icons.length; i++) {
      iconWidget.add(_buildIcon(i));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: iconWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel App'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _getIcons(),
            SizedBox(height: 20.0,),
            DestionationCarousel(),
          ],
        ),
      ),
    );
  }
}
