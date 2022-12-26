import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_example_2/user_list/models/user_error.dart';
import 'package:mvvm_with_provider_example_2/user_list/models/user_list_model.dart';
import 'package:mvvm_with_provider_example_2/user_list/repo/api_status.dart';
import 'package:mvvm_with_provider_example_2/user_list/repo/user_services.dart';

class UserViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  late UserError _userError;
  late UserModel _selectedUser;
  late UserModel _addingUser;

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserModel get selectedUser => _selectedUser;
  UserModel get addingUser => _addingUser;

  UserViewModel() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }

  addUser() async {
    if (!isValid()) {
      return;
    }

    _userListModel.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingUser.name.isEmpty) {
      return false;
    }

    if (addingUser.email.isEmpty) {
      return false;
    }

    return true;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();

    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }

    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse.toString(),
      );

      setUserError(userError);
    }

    setLoading(false);
  }
}
