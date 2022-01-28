import 'dart:convert';

UsuarioDate usuarioDateFromJson(String str) => UsuarioDate.fromJson(json.decode(str));

String usuarioDateToJson(UsuarioDate data) => json.encode(data.toJson());

class UsuarioDate {
    UsuarioDate({
        required this.usuario,
    });

    Usuario usuario;

    factory UsuarioDate.fromJson(Map<String, dynamic> json) => UsuarioDate(
        usuario: Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
    };
}

class Usuario {
    Usuario({
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

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
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
