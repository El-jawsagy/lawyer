import 'package:flutter/material.dart';

import 'gallery.dart';

class Media extends StatelessWidget {
  final media;

  const Media({Key key, this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المكتب ووسائل الاعلام',
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: media.length,
          itemBuilder: (context, i){
            return InkWell(
              child: Container(
                margin: EdgeInsets.all(1),
                child: GridTile(
                  child: Image.asset(media[i]['image'], fit: BoxFit.fill,),
                  footer: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    child: Text(media[i]['title'], style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Gallery(
                          title: media[i]['title'],
                          images: media[i]['subImages'],
                        )));
              },
            );
          }),
    );
  }
}
