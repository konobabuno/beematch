import 'package:beematch/models/user_model.dart';
import 'package:beematch/repositories/database/base_database_repository.dart';
import 'package:beematch/repositories/storage/storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser() {
    return _firebaseFirestore
    .collection('users')
    .doc('PmONhr2dyAH420xqy2Xy')
    .snapshots()
    .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserPictures(String imageName) async {
    String downloadUrl = await StorageRepository().getDownloadURL(imageName);
    print(downloadUrl);

    return _firebaseFirestore
      .collection('users')
      .doc('PmONhr2dyAH420xqy2Xy')
      .update({'imageUrls': FieldValue.arrayUnion([downloadUrl]),})
      .then((_) => print('Success'))
      .catchError((error) => print('Failed: $error'));
  }
  


}