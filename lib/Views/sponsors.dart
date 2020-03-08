import 'package:flutter/material.dart';

class Sponsors extends StatelessWidget {
  final List<String> images = [
    'assets/img/sponsor1.png',
    'assets/img/sponsor2.jpg',
    'assets/img/sponsor3.jpg',
    'assets/img/sponsor4.jpg',
    'assets/img/sponsor5.jpg',
    'assets/img/sponsor6.jpg',
  ];

  final List<String> names = [
    'مجموعة سارة القابضة',
    'فرنشايز',
    'شركة اجواد المتقدمة المحدودة',
    'شركة الآلات والمواد الزراعية المحدودة',
    'أفاكاتو جروب',
    'شركة تراثيات جدة',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("شركاؤنا"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, i) {
          return Card(
            child: Column(
              children: <Widget>[
                Image.asset(images[i]),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(names[i], textAlign: TextAlign.center,),
                  color: Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
