import 'dart:convert';

List<ReqRespuesta> reqRespuestaFromJson(String str) => List<ReqRespuesta>.from(
    json.decode(str).map((x) => ReqRespuesta.fromJson(x)));

String reqRespuestaToJson(List<ReqRespuesta> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReqRespuesta {
  ReqRespuesta({
    this.createAdd,
    this.id,
    this.usuario,
    this.email,
    this.password,
    this.v,
    this.imagen,
    this.celular,
    this.facebook,
  });

  DateTime? createAdd;
  String? id;
  String? usuario;
  String? email;
  String? password;
  int? v;
  String? imagen;
  String? celular;
  String? facebook;

  factory ReqRespuesta.fromJson(Map<String, dynamic> json) => ReqRespuesta(
        createAdd: DateTime.parse(json["CreateAdd"]),
        id: json["_id"],
        usuario: json["usuario"],
        email: json["email"],
        password: json["password"],
        v: json["__v"],
        imagen: json["imagen"],
        celular: json["celular"],
        facebook: json["facebook"],
      );

  Map<String, dynamic> toJson() => {
        "CreateAdd": createAdd?.toIso8601String(),
        "_id": id,
        "usuario": usuario,
        "email": email,
        "password": password,
        "__v": v,
        "imagen": imagen,
        "celular": celular,
        "facebook": facebook,
      };
}
