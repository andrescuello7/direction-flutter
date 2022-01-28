import 'package:flutter/material.dart';
import 'package:direction/src/models/get_method.dart';
import 'package:direction/src/methods/method_app.dart';

class ProfilePosteo extends StatefulWidget {
  const ProfilePosteo({Key? key}) : super(key: key);

  @override
  _ProfilePosteo createState() => _ProfilePosteo();
}

class _ProfilePosteo extends State<ProfilePosteo> {
  @override
  Widget build(BuildContext context) {
    autentication_user();
    return Align(
      child: FutureBuilder(
        future: getApiRest(),
        builder: (BuildContext context, AsyncSnapshot snapshop) {
          if (snapshop.hasData) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return users![index].creador == user_date_session!.id
                    ? _cell(users![index])
                    : Container();
              },
              itemCount: users!.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 0,
                );
              },
            );
          }
          return const Padding(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent, color: Colors.white),
          );
        },
      ),
    );
  }
}

_cell(Usuarios post) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white12,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: NetworkImage(post.perfil ?? ""),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(post.proveedor ?? "",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ],
              ),
              FlatButton(
                onPressed: () {
                  delete_post(post.sId ?? "");
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            post.titulo ?? "",
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            post.contenido ?? "",
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),
        ),
        Center(
          child: post.imagenPublicada == "" || post.imagenPublicada == null
              ? Container()
              : Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(post.imagenPublicada ?? ""),
                        fit: BoxFit.scaleDown),
                  ),
                ),
        ),
      ],
    ),
  );
}
