import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/models/user_model.dart';
import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<User> users = [];

  getUsers() async {
    final db = FirebaseFirestore.instance;
    await db.collection("users").get().then((event) => {
      for (var doc in event.docs) {
        users.add(User.fromFirestore(doc))
      }
    });
    print(users);
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Users List"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Column(
                children: [
                  Text("Name : ${users[index].name}"),
                  Text("Age : ${users[index].age}"),
                  Text("Hobby : ${users[index].hobby}")
                ],
              ),
            );
          }
        )
      )
    );
  }
}