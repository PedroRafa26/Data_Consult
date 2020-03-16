import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_consult/client/model/client.dart';
import 'package:data_consult/client/repository/firebase_storage_repository.dart';
import 'package:data_consult/database/ui/widgets/client_card.dart';
import 'package:data_consult/user/model/user.dart';
import 'package:data_consult/user/repository/cloud_firestore_repository.dart';
import 'package:data_consult/user/repository/cloud_repository_API.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:data_consult/user/repository/auth_repository.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();

  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController

  //Se espera una instancia que contenga el estado de la autenticacion
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  //para acceder al estado de la sesion que sera dado mediante el stream
  Stream<FirebaseUser> get authStatus => streamFirebase;
  //metodo 
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //Casos de uso de la aplicacion o del objeto user
  //1. SignIn a la aplicacion con Google
  Future<FirebaseUser> signIn() =>_auth_repository.signInFirebase();

  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository(); //instancia del objeto para llamar el metodo
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user); //llamada al metodo
  
  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image)=>_firebaseStorageRepository.uploadFile(path, image);
  
  Stream<QuerySnapshot> clientsListStream = Firestore.instance.collection(CloudFirestoreAPI().CLIENTS).snapshots();
  //Este es el objeto que se esta escuchando constantemente
  Stream<QuerySnapshot> get clientsStream => clientsListStream;
  List<ClientCard> buildClient(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildClient(placesListSnapshot);
  

  Future<void> updateClientDate(Client client) => _cloudFirestoreRepository.updateClientDate(client);


  signOut() {
    _auth_repository.signOut();
  }
  
  @override
  void dispose() {

  }
  
}