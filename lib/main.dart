import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//stless
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //lp 단위
      //상중하로 나눔
      home: Scaffold(
        appBar: AppBar(
            title:Text("앱임")),
        body: Text("안녕"),
        bottomNavigationBar: BottomAppBar(
          child:SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(Icons.phone),onPressed: (){},),
                IconButton(icon: Icon(Icons.message),onPressed: (){},),
                IconButton(icon: Icon(Icons.contact_page),onPressed: (){},)
              ],
            ),
          )
        ))
      );
  }
}
