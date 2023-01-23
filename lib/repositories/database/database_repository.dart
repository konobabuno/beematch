import 'package:beematch/models/user_model.dart';
import 'package:beematch/repositories/database/base_database_repository.dart';
import 'package:beematch/repositories/storage/storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser(String userId) {
    return _firebaseFirestore
    .collection('users')
    .doc(userId)
    .snapshots()
    .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserPictures(User user, String imageName) async {
    String downloadUrl = await StorageRepository().getDownloadURL(user, imageName);
    print(downloadUrl);

    return _firebaseFirestore
      .collection('users')
      .doc(user.id)
      .update({'imageUrls': FieldValue.arrayUnion([downloadUrl]),})
      .then((_) => print('Success'))
      .catchError((error) => print('Failed: $error'));
  }
  
  @override
  Future<String> createUser(User user) async{
    String documentId = await _firebaseFirestore
      .collection('users')
      .add(user
      .toMap())
      .then((value){
        print('Usuario agregado, ID: ${value.id}');
        return value.id;
    });
    return documentId; 
  }
  
  @override
  Future<void> updateUser(User user) {
    return _firebaseFirestore
      .collection('users')
      .doc(user.id)
      .update(user.toMap())
      .then((value) => 
        print('Documento del usuario actualizado'));

  }
}