import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//stful : 스테이트 만들기
//stless
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var nameList = [
    "홍길동","길동","길길"
  ];
  var likesList = [0,0,0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //lp 단위
      //상중하로 나눔
      home: Scaffold(
        appBar: AppBar(title:Text("연락처앱")),
        //목록
        body: ListView.builder(
          itemCount: nameList.length,
          itemBuilder: (c,i){
            return ListTile(
                leading: Text(likesList[i].toString()),
                title: Text(nameList[i].toString()),
                trailing :
                TextButton(
                  child: Text("좋아요"),
                  //setState 해줘야 반영됨
                  onPressed: (){
                      setState(() {
                        likesList[i]++;
                      });
                  },
                ),
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
