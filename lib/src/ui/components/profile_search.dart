import 'package:direction/src/data_access/api_screen.dart';
import 'package:flutter/material.dart';
import 'package:direction/src/methods/method_app.dart';

class ProfileSearchView extends StatelessWidget {
  const ProfileSearchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: search_users(),
        builder: (BuildContext context, AsyncSnapshot snapshop) {
          if (snapshop.hasData) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(200),
                      image: DecorationImage(
                          image: NetworkImage(
                              user_date_search![0].imagen ?? exampleImage),
                          fit: BoxFit.cover)),
                ),
                Center(
                  child: Text(
                    user_date_search![0].usuario ?? "",
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
