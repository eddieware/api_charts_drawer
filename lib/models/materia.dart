import 'dart:convert';

class Materia {
  int id;
  String nombre;
  String profesor;
  String cuatrimestre;
  String horario;
  int calificacion;

  Materia(
      {this.id,
      this.nombre,
      this.profesor,
      this.cuatrimestre,
      this.horario,
      this.calificacion});
  factory Materia.fromJoson(Map<String, dynamic> map) {
    return Materia(
        id: map['Id'],
        nombre: map['Nombre'],
        profesor: map['Profesor'],
        cuatrimestre: map['Cuatrimestre'],
        horario: map['Horario'],
        calificacion: map['Calificacion']);
  }

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Nombre": nombre,
      "Profesor": profesor,
      "Cuatrimestre": cuatrimestre,
      "Horario": horario,
      "Calificacion": calificacion
    };
  }

  @override
  String toString() {
    return 'Profile {Id: $id, Nombre: $nombre, Profesor:$profesor, Cuatrimestre:$cuatrimestre, Horario:$horario,Calificacion:$calificacion}';
  }
}

List<Materia> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Materia>.from(data.map((item) => Materia.fromJoson(item)));
}

String profileToJson(Materia data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
