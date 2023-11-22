import 'Dart:convert';

Data fromDataCloud(String data) => Data.fromJson(jsonDecode(data));

String toDataCloud(Data data) => jsonEncode(data.toJson());

void main() {

  String jsonData = '''
  {
    "name": "Murod",
    "friends": [
      "Abdulloh",
      "Abdulmajid",
      "Azizbek"
    ],
    "profession": {
      "type": "Developer",
      "salary": 3500.80,
      "companyBranches": [
        "Yakkasaroy 1.6A",
        "Beruniy ko'chasi 15A",
        "Shaykhontohur, Labzak 70"
      ]
    }
  }
  ''';


  Data data = fromDataCloud(jsonData);

  print(data.name);
  print(data.friends);
  print(data.profession!.type);
  print(data.profession!.salary);
  print(data.profession!.companyBranches);


}

class Data {
  String? name;
  List<String>? friends;
  Profession? profession;

  Data({
    this.name,
    this.friends,
    this.profession,
  });

  Data.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    friends = List<String>.from(json["friends"].map((element) => element.toString()));
    profession = json["profession"] != null ? Profession.fromJson(json["profession"]) : null;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "friends": friends,
      "profession": profession,
    };
    return map;
  }

}

class Profession {
  String? type;
  double? salary;
  List<String>? companyBranches;

  Profession({
    this.type,
    this.salary,
    this.companyBranches,
  });

  Profession.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    salary = json["salary"].toDouble();
    companyBranches = List<String>.from(json["companyBranches"].map((element) => element.toString()));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "type": type,
      "salary": salary,
      "companyBranches": companyBranches,
    };
    return map;
  }

}