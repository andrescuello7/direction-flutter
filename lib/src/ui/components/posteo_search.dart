import 'package:flutter/material.dart';
import 'package:direction/src/data_access/api_screen.dart';
import 'package:direction/src/models/get_method.dart';
import 'package:direction/src/methods/method_app.dart';

class SearchPosteo extends StatefulWidget {
  const SearchPosteo({Key? key}) : super(key: key);

  @override
  _SearchPosteo createState() => _SearchPosteo();
}

class _SearchPosteo extends State<SearchPosteo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: getApiRest(),
        builder: (BuildContext context, AsyncSnapshot snapshop) {
          if (snapshop.hasData) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return users![index].creador == user_date_search![0].id!
                    ? _cell(users![index], context)
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
          return const CircularProgressIndicator(
              backgroundColor: Colors.blueAccent, color: Colors.white);
        },
      ),
    );
  }
}

_cell(Usuarios post, context) {
  autentication_user();
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 3),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: NetworkImage(post.perfil != null
                            ? post.perfil ?? ""
                            : exampleImage),
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
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            post.titulo ?? "",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            post.contenido ?? "",
            style: const TextStyle(color: Colors.white, fontSize: 15),
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
                    ),
                  ),
                ),
        ),
      ],
    ),
  );
}
