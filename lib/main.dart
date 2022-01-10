import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//stless
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //lp 단위
      //상중하로 나눔
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            a+=1;
          },
        ),
        appBar: AppBar(title:Text("앱임")),
        //목록
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (c,i){
            return ListTile(
                leading: Image.asset("icon_no_child.png", height: 50,),
                title: Text("홍길동")
            );
          },
        ),
        bottomNavigationBar: BottomApp(),
      )
    );
    //1. 예시 디자인 준비 (없으면 다른앱 배끼기)
    //2. 예시화면에 네모 그리기
    //3. 바깥 네모부터 하나하나 위젯으로
    //4. 마무리 디자인
  }
}

class BottomApp extends StatelessWidget {
  const BottomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.contact_page)
          ],
        ),
      ),
    );
  }
}


//커스텀 클래스 => 재사용 많은 UI들, 큰 페이지들
class ShopItem extends StatelessWidget {
  //class 에 어떤 파라미터 넣을 수 있는지 정의
  const ShopItem({Key? key}) : super(key: key);

  @override
  build(context) {
    //레이아웃 리턴
    return SizedBox(
      child: Text("안녕"),
    );
  }
}
