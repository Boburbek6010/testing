
import 'dart:convert';

PDP pdpFromJson(String data) => PDP.fromJson(jsonDecode(data));

String pdpToJson(PDP pdp) => jsonEncode(pdp.toJson());

class PDP{
  late String name;
  late int id;
  late bool isCertified;
  late List<String> students;
  late List<List<String>>courses;

  PDP(this.name, this.id, this.students, this.courses, this.isCertified);

  PDP.fromJson(Map<String, dynamic>json){
    name = json["name"];
    id = json["id"];
    isCertified = json["isCertified"];
    students = List<String>.from(json["students"].map((e) => e.toString()));
    courses = List<List<String>>.from(json["courses"].map((e) => List<String>.from(e.map((x) => x.toString()))));
  }


  Map<String, dynamic>toJson(){
    return {
      "name":name,
      "id":id,
      "isCertified":isCertified,
      "students":students,
      "courses":courses,
    };
  }

}