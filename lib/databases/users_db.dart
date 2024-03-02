import 'package:baraton_soko/databases/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersDatabase {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserInfor({required String id}) async => await usersCollection.doc(id).get();
  Future<void> createUser({required Map<String, dynamic> user}) async => await usersCollection.add(user);

}