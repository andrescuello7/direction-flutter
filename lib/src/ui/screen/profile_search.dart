import 'package:direction/src/ui/components/posteo_search.dart';
import 'package:direction/src/ui/components/profile_search.dart';
import 'package:flutter/material.dart';

class ProfileSearch extends StatefulWidget {
  const ProfileSearch({Key? key}) : super(key: key);
  @override
  _ProfileSearch createState() => _ProfileSearch();
}

class _ProfileSearch extends State<ProfileSearch>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.cyan,
            Colors.black45,
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Direction",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.cyan[700],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: const [
              ProfileSearchView(),
              SearchPosteo(),
            ],
          ),
        ),
      ),
    );
  }
}
