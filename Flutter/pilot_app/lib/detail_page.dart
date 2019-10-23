import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final _photo;
  DetailPage(this._photo);

  @override
  State<StatefulWidget> createState() => _DetailPageState(_photo);
}

class _DetailPageState extends State<DetailPage> {
  var _photo;

  _DetailPageState(this._photo);

  void _showDialog(String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Source URL"),
          content: Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final photoId = _photo["id"];
    return new Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network("https://picsum.photos/id/$photoId/600/300"),
              Container(height: 16.0),
              Container(
                  padding: EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 0.0),
                  child: Text(
                    _photo["author"],
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.w400),
                  )),
              Container(height: 16.0),
              Divider(),
              Align(
                  alignment: FractionalOffset.center,
                  child: RaisedButton(
                    child: const Text("Show source", style: TextStyle(fontSize: 16.0, color: Colors.white)),
                    color: Colors.lightBlue,
                    onPressed: () => _showDialog(_photo["url"]),
                  )),
            ],
          ),
        ));
  }
}