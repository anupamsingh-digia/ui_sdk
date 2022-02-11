// dog_card.dart

import 'package:digia_vdl/components/UikWidget.dart';
import 'package:digia_vdl/components/WidgetType.dart';
import 'package:digia_vdl/props/UikTextProps.dart';
import 'package:flutter/material.dart';

class UikText extends UikWidget {
  WidgetType _widgetType;
  UikTextProps _uikTextProps;
  UikText(this._widgetType, this._uikTextProps) : super(_widgetType,_uikTextProps);

  @override
  _UikTextState createState() => _UikTextState(_uikTextProps);
}

class _UikTextState extends State<UikText> {
  UikTextProps _uikTextProps;
  _UikTextState(this._uikTextProps);

  @override
  Widget build(BuildContext context) {
    return Text(_uikTextProps.text);
  }
}