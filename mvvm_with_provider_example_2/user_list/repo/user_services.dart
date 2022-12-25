import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_with_provider_example_2/user_list/models/user_list_model.dart';
import 'package:mvvm_with_provider_example_2/user_list/repo/api_status.dart';
import 'package:mvvm_with_provider_example_2/utils/constants.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var response = await http.get(Uri.parse(USERS_LIST));

      if (SUCCESS == response.statusCode) {
        return Success(
            code: SUCCESS, response: usersListModelFromJson(response.body));
      }

      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(
          code: UNKNOWN_ERROR, errorResponse: 'Unknown error: ${e.toString()}');
    }
  }
}
