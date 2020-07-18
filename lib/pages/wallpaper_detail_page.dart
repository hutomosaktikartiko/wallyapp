import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WallpaperDetailPage extends StatefulWidget {
  final DocumentSnapshot data;

  WallpaperDetailPage({this.data});
  @override
  _WallpaperDetailPageState createState() => _WallpaperDetailPageState();
}

class _WallpaperDetailPageState extends State<WallpaperDetailPage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> tags = widget.data["tags"].toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                child: Hero(
                  tag: widget.data['url'],
                  child: CachedNetworkImage(
                      placeholder: (ctx, url) =>
                          Image(image: AssetImage("assets/placeholder.jpg")),
                      imageUrl: widget.data['url']),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                    );
                  }).toList(),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Wrap(spacing: 10, runSpacing: 10, children: [
                    RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.image,
                      ),
                      label: Text("Set as wallpaper"),
                    ),
                    RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                      ),
                      label: Text("Share"),
                    ),
                    RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                      label: Text("Favorite"),
                    ),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
