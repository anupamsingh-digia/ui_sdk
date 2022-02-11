// dog_card.dart

import 'package:digia_vdl/components/UikWidget.dart';
import 'package:digia_vdl/components/WidgetType.dart';
import 'package:digia_vdl/props/UikImageProps.dart';
import 'package:flutter/material.dart';

class UikImage extends UikWidget {
  WidgetType _widgetType;
  UikImageProps _uikImageProps;
  UikImage(this._widgetType, this._uikImageProps) : super(_widgetType,_uikImageProps);

  @override
  _UikImageState createState() => _UikImageState(_uikImageProps);
}

class _UikImageState extends State<UikImage> {
  UikImageProps _uikImageProps;
  _UikImageState(this._uikImageProps);

  @override
  Widget build(BuildContext context) {
    return Image.network(_uikImageProps.url);
  }
}