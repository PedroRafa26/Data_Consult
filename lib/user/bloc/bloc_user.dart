import 'package:data_consult/user/model/user.dart';
import 'package:data_consult/user/repository/cloud_firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  //Casos de uso de la aplicacion o del objeto user
  //1. SignIn a la aplicacion con Google
  Future<FirebaseUser> signIn() {
    return _auth_repository.signInFirebase();
  }

  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);


  signOut() {
    _auth_repository.signOut();
  }
  
  @override
  void dispose() {

  }
  
}