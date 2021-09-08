import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    // le widget parent(home_screen) écoute
    // grace au stream de user
    // donc on peu lui demander le resultat de ce stream
    // la liste des users
    final users = Provider.of<List<AppUserData>>(context);
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index){
        return UserTile(user: users[index]);
    },
    );
  }
}

class UserTile extends StatelessWidget {
  final AppUserData user;

  UserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.only(
          top: 12.0,
          bottom: 6.0,
          left: 20.0,
          right: 20.0,
        ),
        child: ListTile(
          title: Text(user.name),
          subtitle: Text(
            'Drink ${user.waterCounter}'
          ),
        ),
      ),
    );
  }
}

