import '../enitity/user_entity.dart';
import '../repository/repository.dart';

class RegisterUser {
  final Repository repo;
  RegisterUser({required this.repo});

  Future<void> call(UserEntity user) {
    return repo.register(user);
  }
}
