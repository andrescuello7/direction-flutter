// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:direction/src/data_access/api_screen.dart';
import 'package:direction/src/models/get_auth.dart';
import 'package:direction/src/models/get_method.dart';
import 'package:direction/src/ui/screen-controller/screen/profile_search.dart';
import 'package:direction/src/ui/screen/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/get_search.dart';

//----------------------------------------------------------------------

//Funcion de Get para home

var uri = Uri.parse("${ApiRestDirection}publicacion");
String? title;
String? description;
String? images;
List<Usuarios>? users;

Future<List<Usuarios>?> getApiRest() async {
  http.Response response = await http.get(uri);
  if (response.statusCode == 200) {
    //Lista dynamic
    List<dynamic> map = jsonDecode(response.body);

    users = List<Usuarios>.from(map.map((x) => Usuarios.fromJson(x)));
    users = users!.reversed.toList();

    return users!;
  }
}

//----------------------------------------------------------------------

//Funcion de Delete para Post

Future delete_post(String _id) async {
  var uri = Uri.parse("${ApiRestDirection}publicacion/$_id");
  await http.delete(uri, headers: {"x-auth-token": token!});
}

//----------------------------------------------------------------------

//Funcion de Post para Login

final password = TextEditingController();
final email = TextEditingController();

Future<bool?> LoginPost(
    BuildContext context, String email, String contrasena) async {
  final data = {'email': email, 'password': contrasena};
  var uri = Uri.parse("${ApiRestDirection}auth");
  final response = await http.post(uri,
      body: json.encode(data), headers: {'Content-Type': 'application/json'});
  if (response.statusCode == 200) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    token = response.body;
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text(
            "Contrasena incorrecta intente nuevamente",
            style: TextStyle(color: Colors.redAccent),
          ),
        );
      },
    );
  }
}

//----------------------------------------------------------------------

//Funcion de Post para Login

final titulo = TextEditingController();
final contenido = TextEditingController();

Future HomePosteoFuncion(String title, String content) async {
  final data = {
    'titulo': title,
    'contenido': content,
    'perfil':
        user_date_session!.imagen ?? exampleImage,
    'creador': user_date_session!.id ?? "",
    'proveedor': user_date_session!.usuario ?? "",
  };
  print(data);
  var uri = Uri.parse("${ApiRestDirection}publicacion");
  await http.post(uri, body: data, headers: {"x-auth-token": token!});
}

//----------------------------------------------------------------------

//Funcion de Autentication para Usuario

Usuario? user_date_session;

Future<Usuario?> autentication_user() async {
  var uri = Uri.parse("${ApiRestDirection}auth");
  http.Response response =
      await http.get(uri, headers: {"x-auth-token": token!});
  if (response.statusCode == 200) {
    final users = usuarioDateFromJson(response.body).usuario;
    user_date_session = users;
  }
  return user_date_session;
}

//----------------------------------------------------------------------

//Funcion de Autentication para Usuario

List<ReqRespuesta>? user_date_search;

Future<List<ReqRespuesta?>?> search_users() async {
  var uri = Uri.parse("${ApiRestDirection}publicacion/${ipSearch ?? ""}");
  http.Response response = await http.get(uri);
  if (response.statusCode == 200) {
    final reqRespuesta = reqRespuestaFromJson(response.body);
    user_date_search = reqRespuesta;
  }
  return user_date_search;
}

buscarUsuario(context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ProfileSearch(),
    ),
  );
}

// andrescuellotrabajo@gmail.com