import 'package:flutter/material.dart';
import 'package:lawyer/Models/Strings.dart';
import 'package:lawyer/Views/serviceDetails.dart';
import 'media.dart';
import 'officeServices.dart';

class Home extends StatelessWidget {
  BuildContext mContext;

  Strings strings = new Strings();

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/logo.png'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: strings.categories.length,
        itemBuilder: (context, i) {
          return InkWell(
            child: buildGridTile(i),
            onTap: () {
              String path = strings.categories[i]['path'];
              if (path.isEmpty)
                buildDialog(i, context);
              else if (path == "services") {
                var service;
                if (strings.categories[i]['desc'] == '1')
                  service = strings.lawServices;
                else if (strings.categories[i]['desc'] == '2')
                  service = strings.officePrograms;
                else
                  service = strings.museum;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OfficeServices(
                              title: strings.categories[i]['title'],
                              services: service,
                            )));
              }
              else if (path == "translate") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServiceDetails(
                              service: strings.categories[i],
                            )));
              }
              else if (path == "media") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Media(
                          media: strings.media,
                        )));
              }
            },
          );
        },
      ),
      drawer: buildDrawer(),
    );
  }

  Widget buildGridTile(int i) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Card(
        elevation: 2,
        child: Container(
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            child: buildTitle(strings.categories[i]['title']),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(strings.categories[i]['image']),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Center(
      child: Container(
        child: Text(
          title,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  image: DecorationImage(
                      image: AssetImage('assets/img/img1.jpg'),
                      fit: BoxFit.fill)),
              accountName: Text("Lawyer Khalid Youssef"),
              accountEmail: Text("Khalid.Youssef@gmail.com"),
            ),
            flex: 2,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: strings.drawerItems.length + 1,
              itemBuilder: (context, i) {
                if (i == 0) return buildDefaultDrawerItems(context);
                return buildTile(i - 1, context);
              },
            ),
            flex: 5,
          )
        ],
      ),
    );
  }

  Widget buildDefaultDrawerItems(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Image.asset(
            'assets/img/sponsors.png',
            scale: 1.5,
          ),
          title: Text(
            "شركاؤنا",
          ),
          onTap: () {
            Navigator.pushNamed(context, '/sponsors');
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/img/contact_us.png',
            scale: 1.5,
          ),
          title: Text(
            "اتصل بنا",
          ),
          onTap: () {
            Navigator.pushNamed(context, '/contact');
          },
        ),
        Divider(),
        buildSeparators("من نحن ؟"),
      ],
    );
  }

  Widget buildTile(int i, BuildContext context) {
    return ListTile(
      leading: Image.asset(
        strings.drawerItems[i]['icon'],
        scale: 1.5,
      ),
      title: Text(strings.drawerItems[i]['title']),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ServiceDetails(
                      service: strings.drawerItems[i],
                    )));
      },
    );
  }

  Widget buildSeparators(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 20)),
        Text(
          name,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ],
    );
  }

  void buildDialog(int i, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Stack(
            children: <Widget>[
              Image.asset(
                strings.categories[i]['image'],
                height: 100,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 5,
                right: 10,
                child: Text(
                  strings.categories[i]['title'],
                  textDirection: TextDirection.rtl,
                  softWrap: true,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          content: Text(
            strings.categories[i]['desc'],
            textDirection: TextDirection.rtl,
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("أغلق"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
