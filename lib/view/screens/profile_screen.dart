import 'package:flutter/material.dart';
import 'package:mytal/view/screens/profile_tab_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: const ProfileTabView(),
    );
  }
}
