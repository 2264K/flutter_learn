import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  contact(i, currentName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(0, 4, 12, 4),
            child: Icon(Icons.account_circle, size: 50,)),
        Text(currentName,
          style: TextStyle(
              color: Colors.black,
              fontSize: 24
          ),
        ),
        Expanded(
          child:
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Text(likeCount[i].toString())),
                  TextButton(onPressed: () => incrementLike(i),
                    style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.blue),
                    ),
                    child: Text('좋아요',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        )
      ],
    );
  }
  var a = 3;
  var name = ['김재민', '이현우', '홍길동'];
  var likeCount = [0, 0, 0];
  void incrementLike(int index) {
    setState(() {
      likeCount[index]++;
      print('인덱스 $index의 좋아요: ${likeCount[index]}');
    });
  }
  void addContact(String addingName) {
    setState(() {
      name.add(addingName);
      likeCount.add(0);
      a++;
    });
  }

  @override
  Widget build(BuildContext scfldContext) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: scfldContext, builder: (context){
              return Dialog(
                child: Builder(
                  builder: (dlgContext) {
                    final _inputNameController = TextEditingController();
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      width: MediaQuery.of(scfldContext).size.width*0.8,
                      height: MediaQuery.of(scfldContext).size.height*0.4,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Contact',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                          ),),
                          TextField(
                            controller: _inputNameController,
                            decoration: InputDecoration(enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            hintText: '이름'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: (){
                                Navigator.pop(dlgContext);
                              }, child: Text('Cancel')),
                              Container(
                                padding: EdgeInsets.only(left: 24),
                                child: TextButton(onPressed: (){
                                  Navigator.pop(dlgContext);
                                  addContact(_inputNameController.text);
                                }, child: Text('OK')),),

                            ],
                          )
                        ],
                      ),
                    );
                  }
                ),
              );
            });
          },
          child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('주소록'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add, color: Colors.white, size: 24,)),
        ],
      ),
      body: ListView.builder(
        itemCount: a,
        itemBuilder: (c, i) {
          return contact(i, name[i]);
        }
        ),
      bottomNavigationBar: Bottom(),
    );
  }
}
//과제3,4
class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.message)),
          IconButton(onPressed: () {}, icon: Icon(Icons.contact_page)),
        ],
      ),
    );
  }
}

//과제3 변수 끝