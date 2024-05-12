import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text(
          'Home Page in progress...',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}