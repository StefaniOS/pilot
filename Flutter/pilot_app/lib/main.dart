import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detail_page.dart';
import 'photo_cell.dart';

void main() => runApp(PilotApp());

class PilotApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PilotState();
}

class _PilotState extends State<PilotApp> {
  var _isLoading = false;
  var photos;

  _fetchData() async {
    final url = "https://picsum.photos/v2/list?page=2&limit=50";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final photosJSON = json.decode(response.body);

      setState(() {
        _isLoading = false;
        this.photos = photosJSON;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchData();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Pilot App'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });
                  _fetchData();
                },
              ),
            ],
          ),
          body: Center(
            child: _isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: this.photos.length,
                    itemBuilder: (context, i) {
                      final photo = this.photos[i];
                      return FlatButton(
                        padding: EdgeInsets.all(0.0),
                        child: PhotoCell(photo),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(photo)),
                          );
                        },
                      );
                    },
                  ),
            // Text('Hello Pilot App'),
          )),
    );
  }
}