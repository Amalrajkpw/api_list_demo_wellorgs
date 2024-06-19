import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/list_preview_controller.dart';

class ListPreviewScreen extends StatelessWidget {
  final ListPreviewController listPreviewController =
      Get.put(ListPreviewController());

    ListPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration:const  BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: TextField(
            onChanged: (value) =>
                listPreviewController.searchQuery.value = value,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
          ),
        ),
        body: Obx(() {
          if (listPreviewController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (listPreviewController.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                listPreviewController.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (listPreviewController.userList.isEmpty) {
            return   Center(
              child: Text(
                listPreviewController.errorMessage.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: listPreviewController.filteredList.length,
              itemBuilder: (context, index) {
                final user = listPreviewController.filteredList[index];
                return ListTile(
                  title: Text(
                    user.name,
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    user.email,
                    style:   TextStyle(color: Colors.grey.shade700),
                  ),
                  onTap: () {
                    // Navigate to details screen
                  },
                );
              },
            );
          }
        }),
        backgroundColor: Colors.white,
      );
}
