import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:lawyer/Views/regForm.dart';

class ServiceDetails extends StatelessWidget {
  final service;

  const ServiceDetails({Key key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service['title']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(service['image']),
                Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      service['title'],
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            Html(
              data: service['longDesc'],
              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomBar(context),
    );
  }

  Widget buildBottomBar(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RegForm()));
      },
      child: Container(
        color: Color(0xff785cb4),
        padding: EdgeInsets.all(10),
        child: Text(
          "احجز موعد",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
