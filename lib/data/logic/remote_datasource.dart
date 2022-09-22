import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/utils/constant.dart';
import '../model/user_mode;.dart';

abstract class RemoteDataSource {
  Future createTable();
  Future register(UserModel user);
  Future<bool> login(String email, String pword, Function function);
  Future updateCoordinates(String coordinates);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future createTable() async {
    try {
      final response =
          await http.post(Uri.http(ipv4, 'client/create_table.php'));
      if (200 == response.statusCode) {
        return response.body;
      }
    } catch (e) {
      return e;
    }
  }

  @override
  Future<bool> login(String email, String pword, Function function) async {
    try {
      var response = await http.post(Uri.http(ipv4, 'client/login.php'),
          body: {'email': email, 'pword': pword});

      if (200 == response.statusCode) {
        var source = jsonDecode(response.body);

        if (source['status']) {
          function;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
    return true;
  }

  @override
  Future register(UserModel user) async {
    try {
      var response = await http.post(Uri.http(ipv4, 'client/register.php'),
          body: user.toMap());
      if (200 == response.statusCode) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateCoordinates(String coordinates) async {
    try {
      var response = await http.post(
          Uri.http(ipv4, 'client/add_coordinate.php'),
          body: {'coordinates': coordinates});
      if (response.statusCode == 200) {
        return response.body;
      } else {}
    } catch (e) {
      rethrow;
    }
  }
}
