import '../enitity/user_entity.dart';

abstract class Repository {
  Future createTable();
  Future register(UserEntity user);
  Future<bool> login(String email, String pword, Function function);
}
