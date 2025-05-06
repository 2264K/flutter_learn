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



class _HomePageState extends State<HomePage> {
  List<Contact> name = [];
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
  Widget build(BuildContext context) {
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
        floatingActionButton: FloatingActionButton(onPressed: (){
          showDialog(context: context, builder: (context){
            return dialogAddContact(
              onAdd: (contact) {
                setState(() {
                  name.add(contact);
                });
              }
            );
          });
        }, child: Icon(Icons.add),)
    );

  }
}

class dialogAddContact extends StatefulWidget {
  final void Function(Contact) onAdd;
  const dialogAddContact({super.key, required this.onAdd});

  @override
  _dialogAddContact createState() => _dialogAddContact();
}

class _dialogAddContact extends State<dialogAddContact> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _canSubmit = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validate);
    _phoneController.addListener(_validate);
  }

  void _validate() {
    final can = _nameController.text.isNotEmpty && _phoneController.text.isNotEmpty;
    if (can != _canSubmit) {
      setState(() {
        _canSubmit = can;
      });
    }
  }

  void _saveContact() async {
    final contact  = Contact()
    ..name.first = _nameController.text
    ..phones = [Phone(_phoneController.text)];
    final inserted = await FlutterContacts.insertContact(contact);
    widget.onAdd(inserted);
    print(contact.displayName);
    print(inserted.displayName);
    Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Add Contact'),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text('cancel')),
                TextButton(onPressed: _canSubmit ? _saveContact : null, child: Text('OK', style: TextStyle(color: Colors.lightBlueAccent),))
              ],
            )
          ],
        ),),
    );
  }
}

//앱 하단
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