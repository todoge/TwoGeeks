import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twoGeeks/app/models/user_model.dart';
import 'package:twoGeeks/app/services/firestore_service.dart';
import 'package:twoGeeks/app/services/api_paths.dart';

abstract class Database {

  //  get data
  Future<dynamic> get(String data);

  Stream<UserModel> getUserProfile();

  // updates the key with a new value
  Future<void> updateProfile(String key, dynamic value);

  // updates position
  Future<void> updateLocation(String key, dynamic newValue);
  
  // delete chat
  Future<void> deleteChat(String receiver, String message);
}

class FireStoreDatabase implements Database {
  String uid;
  final _service = FireStoreService.instance;
  FireStoreDatabase({@required this.uid}) : assert(uid != null);

  Future<void> updateProfile(String key, dynamic value) =>
      _service.updateData(path: APIPath.user(uid), data: {key: value});

  Future<void> updateLocation(String key, dynamic newValue) =>
      _service.updateData(path: APIPath.user(uid), data: {key: newValue});

  Stream<UserModel> getUserProfile() {
    return _service.documentStream(
        path: APIPath.user(uid),
        builder: (data) => UserModel.fromMap(data));
  }

  Future<void> deleteChat(String receiver, String message) {
    print(APIPath.message(uid, receiver, message));
    return _service.deleteDocument(APIPath.message(uid, receiver, message));
  }

  

  Future<dynamic> get(String data) async {
    var document = await Firestore.instance.document(APIPath.user(uid));
    return document.get().then((value) => value.data);
  }
}
