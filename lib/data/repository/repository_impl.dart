import '../../domain/enitity/user_entity.dart';
import '../../domain/repository/repository.dart';
import '../logic/remote_datasource.dart';
import '../model/user_mode;.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remote;
  RepositoryImpl({required this.remote});

  @override
  Future register(UserEntity user) async {
    await remote.register(UserModel.toEntity(user));
  }

  @override
  Future createTable() async {
    await remote.createTable();
  }

  @override
  Future<bool> login(String email, String pword, Function function) async {
    return await remote.login(email, pword, function);
  }

  @override
  Future updateCoordinates(String coordinates) async {
    await remote.updateCoordinates(coordinates);
  }
}
