import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_consult/user/model/user.dart';

class CloudFirestoreAPI{

  final String USERS = "users";
  final String CLIENTS = "clients";
  final String POLIZAS = "polizas";

  final Firestore _db = Firestore.instance;

  void updateUserData (User user) async{

    DocumentReference ref = _db.collection(USERS).document(user.uid);
    
    
    /*ref=referencia de base de datos... El devuelve un parametro un objeto 
    de tipo Map osea que debe tener una key, un valor clave y un valor */
    return ref.setData({
      'uid': user.uid, //field1  + valor
      'name': user.name, //field2  + valor
      'email': user.email, //field3 + valor
      'photoURL': user.photoURL,
      'lastSignIn': DateTime.now()

    }, merge: true);

  }

}