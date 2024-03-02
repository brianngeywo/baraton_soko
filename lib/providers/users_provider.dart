import 'package:baraton_soko/models/user_model.dart';
import 'package:baraton_soko/use_cases/users/create_user.dart';
import 'package:baraton_soko/use_cases/users/read_user.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UsersProvider extends ChangeNotifier {
  final  CreateUserUseCase _createUserUseCase;
  final ReadSingleUserUseCase _readSingleUserUseCase;

 UsersProvider({
    required CreateUserUseCase createUserUseCase,
    required ReadSingleUserUseCase readSingleUserUseCase,
  })  : _createUserUseCase = createUserUseCase,
        _readSingleUserUseCase = readSingleUserUseCase;


  Future<void> createUser({required String firstName,
    required String lastName,
    required String username,
    required String phoneNumber,
    required String password, }) async {
    await _createUserUseCase.call(UserModel(id: Uuid().v8(), firstName: firstName, lastName: lastName, username: username, phoneNumber: phoneNumber,
        password: password));
    notifyListeners();
  }

  Future<UserModel> readSingleUser(String userId) async => await _readSingleUserUseCase.call(id: userId);
}
