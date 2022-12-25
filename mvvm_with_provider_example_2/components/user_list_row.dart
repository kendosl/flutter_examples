import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_example_2/components/app_title.dart';
import 'package:mvvm_with_provider_example_2/user_list/models/user_list_model.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final Function onTap;

  UserListRow(this.userModel, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: userModel.name,
          ),
          Text(
            userModel.email,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
