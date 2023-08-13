import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar_widget.dart';

void main() => runApp(const LoginScreen());

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
        bottomNavigationBar: const BottomNavigationBarContainer(),
      );
  }
}