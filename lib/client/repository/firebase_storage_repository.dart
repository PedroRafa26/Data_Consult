import 'dart:io';

import 'package:data_consult/client/repository/firebase_storage_API.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository{

  final _firebaseStorageAPI = FirebaseStorageAPI();

  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageAPI.uploadFile(path, image);
  
}