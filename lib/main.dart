
import 'package:digia_vdl/components/UikText.dart';
import 'package:digia_vdl/components/UikWidget.dart';
import 'package:digia_vdl/components/WidgetType.dart';
import 'package:digia_vdl/props/StandardScreenResponse.dart';
import 'package:digia_vdl/props/UikImageProps.dart';

import 'package:digia_vdl/props/UikTextProps.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'components/UikImage.dart';

void main() {
  runApp(const MyApp());
}





class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;

      Future<http.Response> fetchAlbum() {
        return http.get(
            Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
      }
    });
  }


  List a = [
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/02/01/22/02/mountain-landscape-2031539_960_720.jpg",
    "https://cdn.pixabay.com/photo/2014/09/14/18/04/dandelion-445228_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/08/09/21/54/yellowstone-national-park-1581879_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/07/11/15/43/pretty-woman-1509956_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/02/13/12/26/aurora-1197753_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/08/05/26/woman-1807533_960_720.jpg",
    "https://cdn.pixabay.com/photo/2013/11/28/10/03/autumn-219972_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/17/19/08/away-3024773_960_720.jpg",
  ];


  dynamic getWidget(String? wType) {
    switch (wType) {
      case "UikImage":
        return UikImage(WidgetType.UikImage, UikImageProps(
            "https://cdn.pixabay.com/photo/2017/12/17/19/08/away-3024773_960_720.jpg"));
      case "UikText" :
        return UikText(WidgetType.UikText, UikTextProps("HELLO"));
      default:
        return UikText(WidgetType.UikText, UikTextProps("HELLO"));
    }
  }

  //currnt fold reload
  @override
  Widget build(BuildContext context) {
    String rawJson = '{"layout": [{"type" :"UikText"},{"type" : "UikImage"},{"type" : "UikImage"}, {"type" :"UikText"},{"type" :"UikText"}, {"type" : "UikImage"}, {"type" : "UikImage"}],"age":30}';

    StandardScreenResponse standardScreenResponse = StandardScreenResponse
        .fromJson(jsonDecode(rawJson));
    int length = standardScreenResponse.layout?.length ?? 2;
    List<UikWidget> screenWidgets = [];
    for( int widgetIndex =0; widgetIndex< length ;widgetIndex++){
      UikWidget widget = getWidget(standardScreenResponse.layout?[widgetIndex].type);
     screenWidgets.add(widget);
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Images Renderaaaed "),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return screenWidgets[index];
        },
        itemCount: standardScreenResponse.layout?.length,
      ),
    );
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Displaying Images"),
//       ),
//       body: ListView.builder(
//         itemBuilder: (BuildContext ctx, int index) {
//           return Image.network(a[index]);
//         },
//         itemCount: a.length,
//       ),
//     );
//   }
// }
}