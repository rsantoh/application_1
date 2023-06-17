// To parse this JSON data, do
//
//     final estudiantes = estudiantesFromMap(jsonString);

import 'dart:convert';

class Estudiantes {
    Estudiantes({
        this.id,
        this.fotoEstudiante,
        required this.idMatricula,
        required this.nombreEstudiante,
        this.isChecked,
        this.evaluacion,
        this.nomNota,
        this.descripcion,
        this.idRegEvaluacion,
        this.idPeriodo
    });

    int? id;
    String? fotoEstudiante;
    int idMatricula;
    String nombreEstudiante;
    bool? isChecked;
    String? evaluacion;
    String? nomNota;
    String? descripcion;
    String? idRegEvaluacion;
    String? idPeriodo;



    factory Estudiantes.fromJson(String str) => Estudiantes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Estudiantes.fromMap(Map<String, dynamic> json) => Estudiantes(
        id: json["id"],
        fotoEstudiante: json["fotoEstudiante"],
        idMatricula: json["idMatricula"],
        nombreEstudiante: json["nombreEstudiante"],
        isChecked: json["isChecked"],
        evaluacion: json["evaluacion"],
        nomNota: json["nomNota"],
        descripcion: json["descripcion"],
        idRegEvaluacion: json["idRegEvaluacion"],
        idPeriodo: json["idPeriodo"],

    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "fotoEstudiante": fotoEstudiante,
        "idMatricula": idMatricula,
        "nombreEstudiante": nombreEstudiante,
        "isChecked": isChecked,
        "evaluacion": evaluacion,
        "nomNota": nomNota,
        "descripcion": descripcion,
        "idRegEvaluacion":idRegEvaluacion,
        "idPeriodo":idPeriodo

    };
}
