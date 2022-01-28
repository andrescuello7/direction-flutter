import 'package:direction/src/data_access/api_screen.dart';
import 'package:direction/src/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:direction/src/methods/method_app.dart';

class ProfilePerson extends StatelessWidget {
  const ProfilePerson({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: autentication_user(),
      builder: (BuildContext context, AsyncSnapshot snapshop) {
        if (snapshop.hasData) {
          return Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [_buildButton(context)],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50)),
                        image: DecorationImage(
                            image: NetworkImage(
                                user_date_session!.imagen ?? exampleImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 20, left: 20, top: 40),
                child: Text(
                  user_date_session!.usuario ?? "",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 70,
                color: const Color(0xFF000000).withOpacity(0.5),
              )
            ],
          ),
          child: FlatButton(
            onPressed: () {},
            child: const Icon(
              Icons.brightness_4_outlined,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 70,
                color: const Color(0xFF000000).withOpacity(0.5),
              )
            ],
          ),
          child: FlatButton(
            onPressed: () {},
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 70,
                color: const Color(0xFF000000).withOpacity(0.5),
              )
            ],
          ),
          child: FlatButton(
            onPressed: () {},
            child: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 70,
                color: const Color(0xFF000000).withOpacity(0.5),
              )
            ],
          ),
          child: FlatButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
