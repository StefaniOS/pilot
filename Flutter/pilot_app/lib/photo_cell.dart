import 'package:flutter/material.dart';

class PhotoCell extends StatelessWidget {
  final _photo;

  PhotoCell(this._photo);

  @override
  Widget build(BuildContext context) {
    final photoId = _photo["id"];
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network("https://picsum.photos/id/$photoId/600/300"),
              Container(height: 8.0),
              Text(
                _photo["author"],
                style: TextStyle(fontSize: 16.0),
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}