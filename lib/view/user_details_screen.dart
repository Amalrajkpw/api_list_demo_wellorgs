import 'package:flutter/material.dart';

import '../model/response_model.dart';

class UserDetailsScreen extends StatelessWidget {
  final ResponseModel user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.deepPurple.shade50,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Username: ${user.username}',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${user.email}',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
