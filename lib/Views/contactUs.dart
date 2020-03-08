import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اتصل بنا",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                padding: EdgeInsets.all(30),
                child: Image.asset('assets/img/logo_black.png'),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              buildTitle("العنوان:", Icons.location_on),
              buildText(
                  "مكتب المحامي خالد أمين يوسف للمحاماة والإستشارات القانونية محكم وموثق معتمد البربد الوطني واصل رقم موحد 2831 – 23513(1) المملكة العربية السعودية"),
              Divider(),
              buildTitle("خدمة العملاء:", Icons.phone),
              buildText("920001538"),
//              Text("920001538", style: TextStyle(color: Colors.grey),),
              Divider(),
              buildTitle("جوال:", Icons.phone),
              buildText("6464 55046 966+"),
              Divider(),
              buildTitle("info@lawyerdrkhalid.com", Icons.email, link: true),
              Divider(),
              buildTitle("http://lawyerdrkhalid.com", FontAwesomeIcons.globe,
                  link: true),
              Divider(),
              buildTitle("ساعات العمل:", Icons.work),
              buildText(
                  "من الأحد للخميس من الساعة 9:00 ص وحتى الساعة 6 م ماعدا الجمعة والسبت"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildText(String text) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 10),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget buildTitle(String title, IconData icon, {bool link = false}) {
    return Row(
      children: <Widget>[
        Icon(icon),
        Container(
          margin: EdgeInsets.only(right: 8, top: 4),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: link ? Colors.lightBlueAccent : Colors.black,
              decoration: link ? TextDecoration.underline : null,
            ),
          ),
        ),
      ],
    );
  }
}
