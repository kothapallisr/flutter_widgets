import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  GridItem({this.widgetName, this.widget});

  String widgetName;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Chip(
            label: Text(
              widgetName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          widget
        ],
      ),
      color: Colors.teal[100],
    );
  }
}
