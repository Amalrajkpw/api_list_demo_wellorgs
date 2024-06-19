import 'package:api_list_demo_wellorgs/model/response_model.dart';
import 'package:api_list_demo_wellorgs/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class ListPreviewController extends GetxController {
  var isLoading = true.obs;
  var userList = <ResponseModel>[].obs;
  var filteredList = <ResponseModel>[].obs;
  var searchQuery = ''.obs;
  var errorMessage = ''.obs;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    ApiServices().fetchUsers();
    filterResults();
    debounce(searchQuery, (_) => filterResults(),
        time: const Duration(milliseconds: 300));
  }

  void filterResults() {
    if (searchQuery.value.isEmpty) {
      filteredList.value = userList;
    } else {
      filteredList.value = userList
          .where((user) =>
              user.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  // void updateUserList() {
  //   userList.refresh();
  //   update();
  // }
}
