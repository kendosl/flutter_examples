import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_example_2/components/app_title.dart';
import 'package:mvvm_with_provider_example_2/user_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(userViewModel.selectedUser.name),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(title: userViewModel.selectedUser.name),
            const SizedBox(height: 5.0),
            Text(
              userViewModel.selectedUser.email,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5.0),
            Text(
              userViewModel.selectedUser.phone,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5.0),
            Text(
              userViewModel.selectedUser.website,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5.0),
            Text(
              userViewModel.selectedUser.address.street,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              userViewModel.selectedUser.address.city,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
