
import 'package:beematch/models/user_model.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser();
  Future<void> updateUserPictures(String imageName);
}