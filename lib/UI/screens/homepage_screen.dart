import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key, this.code}) : super(key: key);

  final code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(
          child: code != null ? Text("promocode : ${code.split("=") [1]}" , style: const TextStyle(fontSize: 20),
          ) : const CircularProgressIndicator()
      ),
    );
  }
}
