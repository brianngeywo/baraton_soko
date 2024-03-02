import 'package:baraton_soko/databases/users_db.dart';
import 'package:baraton_soko/models/user_model.dart';

class ReadSingleUserUseCase {
  final UsersDataBase _userDatabase;
  ReadSingleUserUseCase(this._userDatabase);

  Future<UserModel> call({required String id}) async {
    final result = await _userDatabase.getUserInfor(id: id);
    return UserModel.fromMap(result.data()!);
  }
}