import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp()
    ));
}

//stful : 스테이트 만들기
//stless
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var nameList = [
    "홍길동","길동","길길"
  ];
  var likesList = [0,0,0];
  var phoneList = ["010-4195-5964","010-3030-4444","010-4555-2222"];

  deleteName(index)=>setState((){
    print(index);
    nameList.removeAt(index);
    phoneList.removeAt(index);
  });

  appendName(String name)=>setState((){
      nameList.add(name);
  });

  appendPhone(String phone)=>setState((){
      phoneList.add(phone);
  });

  @override
  //context: 족보
  build(context) {
    return Scaffold(
        appBar: AppBar(title:Text("연락처 앱")),
        //목록
        body: ListView.builder(
          itemCount: nameList.length,
          itemBuilder: (c,i){
            return ListTile(
                leading: Image.asset('icon_no_child.png'),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nameList[i].toString()),
                      Text(phoneList[i].toString())
                    ]),
                trailing :
                TextButton(
                  child: Text("삭제"),
                  //setState 해줘야 반영됨
                  onPressed: (){
                      deleteName(i);
                  },
                ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Text("+"),
          onPressed: (){
            // print(context.findAncestorWidgetOfExactType<MaterialApp>());
            showDialog(context: context, builder: (context){
              return DialogUI(
                  name:nameList,
                  appendName:appendName,
                  appendPhone:appendPhone
              );
            });
          },
        ),
        bottomNavigationBar: BottomApp(),
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

//다이얼로그 클래스
class DialogUI extends StatefulWidget {
  //중괄호는 선택적 파라미터 {}
  DialogUI({
    Key? key,
    this.name,
    required this.appendName,
    required this.appendPhone
  }) : super(key: key);

  //부모에서 온 값은 read-only가 좋음
  final name;
  var inputData = TextEditingController();
  var inputData2 = '';

  final Function(String name) appendName;
  final Function(String phone) appendPhone;

  @override
  State<DialogUI> createState() => _DialogUIState();
}

class _DialogUIState extends State<DialogUI> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      title: Text("Contact"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: widget.inputData,
            decoration: InputDecoration(hintText: "이름"),
          ),
          TextField(
            onChanged: (text){
              widget.inputData2 = text;
            },
            decoration: InputDecoration(hintText: "전화번호"),
          )
        ],

      ),
      actions: [
        TextButton(onPressed: (){
          //현재 페이지 제거
          Navigator.pop(context);
        },
            child: Text("취소")
        ),
        TextButton(onPressed: (){
          if(widget.inputData.text.isNotEmpty && widget.inputData2.isNotEmpty){
            widget.appendName(widget.inputData.text);
            widget.appendPhone(widget.inputData2);
            Navigator.pop(context);
          }
        },
            child: Text("완료")
        )
      ],
    );
  }
}
