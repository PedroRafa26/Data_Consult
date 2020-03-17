import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_consult/client/model/client.dart';
import 'package:data_consult/database/ui/widgets/client_card.dart';
import 'package:data_consult/user/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreAPI{

  final String USERS = "users";
  final String CLIENTS = "clients";
  final String POLIZAS = "polizas";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

    }, merge: true ); //commit de base de datos para certificar que el dato sera ingresado

  }

  Future<void> updateClientData(Client client) async {
    CollectionReference refClients = _db.collection(CLIENTS);
    //metodo add, generara un identificador unico y autoincrementable
    
    //
    await _auth.currentUser().then((FirebaseUser user){

     refClients.add(
      {
      
      'id':client.id,
      'name': client.name,
      'lastName':client.lastName,
      'addres': client.addres,
      'email': client.emailClient,
      'cellphone':client.cellphone,
      'userOwner': _db.document("${USERS}/${user.uid}")
      // 'polizas':  "${POLIZAS/}"//tipo de dato referencia "${Collecion}/${identificador}"
      // para asignar una referencias se procede de la siguiente manera
      // 'polizas': _db.document("${POLIZAS}/${client.id}") //REFERENCE
      });/*.then((DocumentReference dr){
        dr.get().then((DocumentSnapshot snapshot){
          snapshot.documentID; //ID del place que se acaba de asignar
          //Ingresar ID como diferencia y como array
          DocumentReference refUsers = _db.collection(USERS).document(client.id);
          refUsers.updateData({
            'myInsurance': FieldValue.arrayUnion([_db.document("${POLIZAS}/${snapshot.documentID}")])
          });
        });
      });*/
    });
  }



  //Metodo que devuelve una lista de Clientes
  List<ClientCard> buildClient(List<DocumentSnapshot> clientsListSnapshot){
    //instancia del objeto a devolver
    List<ClientCard> clientCards = List<ClientCard>();
    clientsListSnapshot.forEach((c){

      clientCards.add(ClientCard(client: 
      Client(
        id: c.data['id'], 
        name: c.data['name'], 
        lastName:c.data['lastName'], 
        cellphone: c.data['cellphone']),
        ));
    });

    return clientCards;

  }
  

}