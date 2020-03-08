import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  final String title;
  final List<String> images;

  const Gallery({Key key, this.title, this.images}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: widget.images == null
            ? Center(
                child: Text("Under Construction"),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: widget.images.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.all(2),
                    child: GridTile(
                      child: Image.asset(
                        widget.images[i],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }));
  }
}
