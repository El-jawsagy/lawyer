import 'package:flutter/material.dart';

class RegForm extends StatefulWidget {
  @override
  _RegFormState createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حجز موعد"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
                padding: EdgeInsets.all(30),
                child: Image.asset('assets/img/logo.png'),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xff785cb4),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    hintText: "الاسم",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    hintText: "البريد الالكتروني",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "رقم الهاتف",
                  ),
                ),
              ),
              FlatButton(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(40),
                  padding: EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                      color: Color(0xff785cb4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Text("حجز موعد", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
