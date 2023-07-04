import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // User? user;
  // String? email = '';
  String message = '';
  String mail = '';

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<void> getdata () async
  {

    try{
      User? user = await _auth.currentUser;
      if(user!=null)
        {
          mail = user.email ?? '';
          print(mail);
          
        }
    }
    catch(e)
    {

      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(20.0),
              backgroundColor: MaterialStateProperty.all(Color(0xFFC33764)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            child: Text(
              'Sign Out',
              style: TextStyle(fontSize: 10.0),
            ),
          ),
        ],
        title: Text('⚡️Chat'),
        centerTitle: true,
        backgroundColor: Color(0xFFC33764),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFD66D75),
                Color(0xFFE29587),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ListView(
                    // Add your messages here
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF0f3443),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            message = value;
                            // Do something with the user input.
                          },
                          style: TextStyle(
                              color: Colors.white), // Set text color to white
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            hintStyle: TextStyle(
                                color:
                                    Colors.white), // Set hint text color to white
                            border: InputBorder.none, // Remove the border
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () async{
                            
                            try{
                              await _store.collection('message').add({'text':message,'sender':mail});
                            }
                            catch(e)
                            {
                              print(e);
                            }
                            
                          },
                          icon: Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
