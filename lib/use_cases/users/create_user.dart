import 'package:baraton_soko/databases/users_db.dart';
import 'package:baraton_soko/models/user_model.dart';

class CreateUserUseCase {
  final UsersDatabase _userDatabase;

  CreateUserUseCase(this._userDatabase);

  Future<void> call(UserModel user) async => await _userDatabase.createUser(user: user.toMap());
}
