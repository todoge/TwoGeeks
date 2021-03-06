import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/app/detail/backButton.dart';
import 'package:twoGeeks/app/detail/detailInfo/aboutMe.dart';
import 'package:twoGeeks/app/detail/detailInfo/strengthAndWeakness/strengthAndWeakness.dart';
import 'package:twoGeeks/app/detailTutor/detailTutorHeader.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/services/user.dart';

class DetailTutor extends StatelessWidget {
  final String uid;
  Firestore store;
  DetailTutor({this.uid, this.store});

  void _sendTutorRequest(context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    User user = await auth.currentUser();
    // get user's tutor list to check if friend is already a friend
    DocumentSnapshot userData =
        await Firestore.instance.collection("users").document(user.uid).get();
    List<dynamic> tutorList = userData.data["tutors_user_uid"];

    if (!tutorList.contains(uid)) {
      await Firestore.instance.collection("users").document(uid).updateData({
        "tutorrequest_user_uid": FieldValue.arrayUnion([user.uid]),
      });
      Scaffold.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          content: Row(
            children: <Widget>[
              Container(
                child: Icon(Icons.person_add),
                margin: EdgeInsets.only(right: 20),
              ),
              Text("Tutor Request Sent!"),
            ],
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (store == null) {
      store = Firestore.instance;
    }
//    print(store);
    return Scaffold(
      body: Hero(
        tag: "tutor",
        child: StreamBuilder(
            stream: store.collection("users").document("$uid").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    key: Key("loader"),
                  ),
                );
              } else {
                DocumentSnapshot data = snapshot.data;
                return SingleChildScrollView(
                  key: Key("Detail ScrollView"),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 18.0 / 18.0,
                            child: data["profilePic"] != ""
                                ? Image.network(data["profilePic"])
                                : Image.asset(
                                    "images/sample_pictures/guy1.jpg",
                                    key: Key("image of friend"),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ...detailTutorHeader(data),
                                data["aboutMe"] == ""
                                    ? Container()
                                    : aboutMe(data["aboutMe"]),
                                data["strength"].length == 0 &&
                                        data["weakness"].length == 0
                                    ? Container()
                                    : strengthAndWeakness(
                                        data["strength"], data["weakness"]),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff8080ff),
                                Color(0xff80b3ff)
                              ]),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                            ),
                            margin: EdgeInsets.only(left: 30, top: 30, bottom: 30),
                            child: FlatButton(
                              onPressed: () => _sendTutorRequest(context),
                              child: Text("Send Tutor Request"),
                            ),
                          )
                        ],
                      ),
                      backButton(context)
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
