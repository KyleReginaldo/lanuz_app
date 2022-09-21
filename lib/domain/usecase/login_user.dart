// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../repository/repository.dart';

class LoginUser {
  final Repository repo;
  LoginUser({required this.repo});
  Future<bool> call(String email, String pword, Function function) async {
    return await repo.login(email, pword, function);
  }
}
