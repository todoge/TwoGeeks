import 'package:flutter/material.dart';
import 'package:twoGeeks/common_widgets/NavBar.dart';
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twoGeeks/app/settings/setting_button.dart';

class Settings extends StatelessWidget {

  // sign out
  Settings({@required this.onSignOut});
  final VoidCallback onSignOut;

  // temporary method to sign in for testing
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      onSignOut();
    } catch (e) {
      print("Error Encountered ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: NavBar(context, 4),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.only(top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30,),
          Container(
            color: Colors.grey[400],
            height: 40,
            alignment: Alignment.center,
            child: Text(
              "Settings",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40,),
          SettingButton(text: "Log Out", textColor: Colors.white, onPressed: _signOut, buttonColor: Colors.red[600],),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}