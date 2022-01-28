class Usuarios {
  String? createAdd;
  String? sId;
  String? titulo;
  String? imagenPublicada;
  String? proveedor;
  String? perfil;
  String? contenido;
  String? creador;
  int? iV;
  Usuarios(
      {this.createAdd,
      this.sId,
      this.titulo,
      this.imagenPublicada,
      this.proveedor,
      this.perfil,
      this.contenido,
      this.creador,
      this.iV});
  Usuarios.fromJson(Map<String, dynamic> json) {
    createAdd = json['CreateAdd'];
    sId = json['_id'];
    titulo = json['titulo'];
    proveedor = json['proveedor'];
    perfil = json['perfil'];
    imagenPublicada = json['imagenPublicada'];
    contenido = json['contenido'];
    creador = json['creador'];
    iV = json['__v'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CreateAdd'] = createAdd;
    data['_id'] = sId;
    data['titulo'] = titulo;
    data['proveedor'] = proveedor;
    data['perfil'] = perfil;
    data['imagenPublicada'] = imagenPublicada;
    data['contenido'] = contenido;
    data['creador'] = creador;
    data['__v'] = iV;
    return data;
  }
}
