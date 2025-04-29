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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //과제 1
      /*appBar: AppBar(
        title: const Text('내 첫 앱'),
        backgroundColor: Colors.blue,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 150, height: 150,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.blue,
          ),
          child: Column(
            children: [
              Text('안녕',
                  style: TextStyle( color: Colors.white,fontSize: 24)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.person),
            ],
          ),
        )

    ),*/
      appBar: AppBar(
        title: Text('금호동3가'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),],
        leading: Icon(Icons.keyboard_arrow_down),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(12, 48, 12, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 100,
                    child: Image.asset('assets/21935_11819_1319.jpg')),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('캐논 DSLR 100D',
                        style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400,),),
                      Text('#성동구 행당동',
                        style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300,),),
                      Text('210,000원',
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600,),)
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                      Text('4'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.description),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}
