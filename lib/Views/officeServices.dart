import 'package:flutter/material.dart';
import 'package:lawyer/Views/regForm.dart';
import 'package:lawyer/Views/serviceDetails.dart';

class OfficeServices extends StatelessWidget {
  final String title;
  final services;

  const OfficeServices({Key key, this.title, this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.6),
        itemCount: services.length,
        itemBuilder: (context, i) {
          return InkWell(

            child: buildGridTile(i, context),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ServiceDetails(
                        service: services[i],
                      )));
            },
          );
        },
      ),
    );
  }

  Widget buildGridTile(int i, BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(services[i]['image']),
                        fit: BoxFit.fill)),
              ),
              flex: 3,
            ),
            Expanded(
                child: Container(
              child: Text(
                services[i]['title'],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
              margin: EdgeInsets.all(10),
            )),
            Expanded(
              child: Container(
                child: Text(
                  services[i]['shortDesc'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                ),
                margin: EdgeInsets.only(right: 5, left: 5),
              ),
              flex: 1,
            ),
            Divider(),
            Expanded(child: buildButtonsRow(context, i)),
          ],
        ),
        elevation: 4,
      ),
    );
  }

  Widget buildButtonsRow(BuildContext context, int i) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff785cb4),
            ),
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegForm()));
                },
                child: Text(
                  "احجز",
                  style: TextStyle(color: Colors.white),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                )),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff785cb4),
            ),
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ServiceDetails(
                            service: services[i],
                          )));
                },
                child: Text(
                  "المزيد",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
      ],
    );
  }
}
