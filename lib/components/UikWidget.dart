// dog_card.dart

import 'package:digia_vdl/components/WidgetType.dart';
import 'package:digia_vdl/props/WidgetProps.dart';
import 'package:flutter/material.dart';

abstract class UikWidget extends StatefulWidget {
  WidgetType type;
  WidgetProps _widgetProps;
  UikWidget(this.type,this._widgetProps);
  // @override
  // _UikWidgetState createState() => _UikWidgetState(type);
}

// class _UikWidgetState extends State<UikWidget> {
//   final String text;
//   _UikWidgetState(this.text);
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Text(text);
//   // }
// }