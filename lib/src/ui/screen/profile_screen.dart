import 'package:direction/src/ui/components/posteo_profile.dart';
import 'package:direction/src/ui/components/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: const [
          ProfilePerson(),
          ProfilePosteo(),
        ],
      ),
    );
  }
}
