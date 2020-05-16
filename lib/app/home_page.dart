import 'package:flutter/material.dart';
import 'package:twoGeeks/app/settings_page.dart';
import 'package:twoGeeks/common_widgets/NavBar.dart';

class HomePage extends StatelessWidget {

  // sign out
  HomePage({@required this.onSignOut});
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Geeks'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "settings",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(
                onSignOut: onSignOut,
              )),);
            }
          )
        ],
      ),
      body: Column(
        children: <Widget>[
        ],
      ),
      bottomNavigationBar: BottomAppBar(child: NavBar(2),),
    );
  }
}