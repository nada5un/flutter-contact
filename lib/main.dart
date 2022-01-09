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
        appBar: AppBar(title:Text("앱임")),
        body: Container(
          height: 150,
          padding: EdgeInsets.all(10),
          child:Row(
            children: [
              Image.asset("imogi.png",width: 150),
              //박스 하나만 꽉 채우기
              Expanded(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("캐논 DSLR 100D (단렌즈, 충전기 16기가 SD 포함)",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("성동구 행당동 끌올 10분 전"),
                    Text("210,000원"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite),
                        Text("4")
                      ],
                    )
                  ],
                ),
              )
            ],
          )
      ),
      ));
    //1. 예시 디자인 준비 (없으면 다른앱 배끼기)
    //2. 예시화면에 네모 그리기
    //3. 바깥 네모부터 하나하나 위젯으로
    //4. 마무리 디자인
  }
}
