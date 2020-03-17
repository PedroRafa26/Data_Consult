import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_consult/client/model/client.dart';
import 'package:data_consult/database/ui/widgets/client_card.dart';
import 'package:data_consult/user/model/user.dart';
import 'package:data_consult/user/repository/cloud_repository_API.dart';

class CloudFirestoreRepository{
  
  //instancia del API
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);
  Future<void> updateClientDate(Client client) => _cloudFirestoreAPI.updateClientData(client);
  List<ClientCard> buildClient(List<DocumentSnapshot> clientsListSnapshot) => _cloudFirestoreAPI.buildClient(clientsListSnapshot);

}