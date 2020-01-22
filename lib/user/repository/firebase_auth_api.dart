import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<FirebaseUser> signIn() async { //async trabajo en 2do plano

  //primera autenticacion con google
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn(); //await -> ejecutar en 2do plano... Cuadro de dialogo para eleccion de cuenta
  GoogleSignInAuthentication gSA = await googleSignInAccount.authentication; //credenciales de la cuenta para iniciar

  //segunda autenticacion con Firebase
  FirebaseUser user = await _auth.signInWithCredential( //usar la credencial obtenida de Google
    GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken));

  return user; 

}

}