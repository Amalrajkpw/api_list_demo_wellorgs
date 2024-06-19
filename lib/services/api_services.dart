import 'dart:convert';

import 'package:api_list_demo_wellorgs/controller/list_preview_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/response_model.dart';

final ListPreviewController listPreviewController =
    Get.put(ListPreviewController());

class ApiServices {
  void fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        var users =
            jsonData.map((user) => ResponseModel.fromJson(user)).toList();
        listPreviewController.userList.value = users;
      } else {
        listPreviewController.errorMessage.value = 'Failed to load users';
        Get.snackbar(
            listPreviewController.errorMessage.value, "error occurred");
      }
    } catch (e) {
      listPreviewController.errorMessage.value = e.toString();
      Get.snackbar(listPreviewController.errorMessage.value, "error occurred");
    } finally {
      listPreviewController.isLoading.value = false;
    }
  }
}
