import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_example_2/components/app_error.dart';
import 'package:mvvm_with_provider_example_2/components/app_loading.dart';
import 'package:mvvm_with_provider_example_2/components/user_list_row.dart';
import 'package:mvvm_with_provider_example_2/user_list/models/user_list_model.dart';
import 'package:mvvm_with_provider_example_2/user_list/view_models/user_view_model.dart';
import 'package:mvvm_with_provider_example_2/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            onPressed: () async {
              openAddUser(context);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () async {
              userViewModel.getUsers();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(userViewModel),
          ],
        ),
      ),
    );
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return const AppLoading();
    }

    if (userViewModel.userError != null) {
      return AppError(userViewModel.userError!.message);
    }

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = userViewModel.userListModel[index];
          return UserListRow(
            userModel,
            () async {
              userViewModel.setSelectedUser(userModel);
              openUserDetails(context);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: userViewModel.userListModel.length,
      ),
    );
  }
}
