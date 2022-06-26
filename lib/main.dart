import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by 'flutter_map.dart'
import 'package:fluttermapspractice/staticdata.dart';
import 'package:latlong2/latlong.dart'; // Recommended for most use-cases

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Map Practice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    StaticData.size = MediaQuery.of(context).size;
    StaticData.height = StaticData.size.height - 80;
    StaticData.width = StaticData.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              // height: 50,
              color: Colors.amber[500],
              constraints: BoxConstraints(
                  minHeight: StaticData.height, minWidth: StaticData.width,
                  maxHeight: StaticData.height, maxWidth: StaticData.width),
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(51.509364, -0.128928),
                  zoom: 9.2,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                ],
                nonRotatedChildren: [
                  AttributionWidget.defaultWidget(
                    source: 'OpenStreetMap contributors',
                    onSourceTapped: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
