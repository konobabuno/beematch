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
    String downloadUrl =
        await StorageRepository().getDownloadURL(user, imageName);
    print(downloadUrl);

    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update({
          'imageUrls': FieldValue.arrayUnion([downloadUrl]),
        })
        .then((_) => print('Success'))
        .catchError((error) => print('Failed: $error'));
  }

  @override
  Future<void> createUser(User user) async {
    await _firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }

  @override
  Future<void> updateUser(User user) {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toMap())
        .then((value) => print('Documento del usuario actualizado'));
  }
}
