import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_consult/user/model/user.dart';
import 'package:data_consult/user/repository/cloud_repository_API.dart';

class CloudFirestoreRepository{

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);


}