import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

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
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
var name = [];

class _HomePageState extends State<HomePage> {
  getPermission() async{
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);

      setState(() {
        name = contacts;
      });
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      openAppSettings();
    }
  }




  @override
  Widget build(BuildContext scfldContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('주소록'),
        actions: [
          IconButton(onPressed: () {
            getPermission();
          }, icon: Icon(Icons.contacts, color: Colors.white, size: 24,)),
        ],
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (c, i) {
          return ListTile(
            leading: Icon(Icons.account_circle, size: 60,),
            title: Text(name[i].displayName),
          );
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