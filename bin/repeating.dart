import 'dart:convert';

void main(){

  String data = '''
  {
 "name": "Dart",
  "tools": [
    "Operations",
    "Loops",
    2,
    "Streams"
  ],
  "id":3,
  "isCheck":true
}
  ''';

  Stream<int>.periodic( const Duration(seconds: 2), (count) =>count *count).take(5);




  Map<String, dynamic> map = jsonDecode(data);

  Construct construct = Construct.fromJson(map);

  List<String>? list = construct.tools;

  print(list);
}

class Construct{
  List<String>? tools;
  String? name;
  int? id;
  bool? isCheck;

  Construct(this.tools, this.name, this.id, this.isCheck);

  Construct.fromJson(Map<String, dynamic> json){
    tools = List.from(json["tools"].map((e) => e.toString()));
    name = json["name"];
    id = json["id"];
    isCheck = json["isCheck"];
  }

  Map<String, dynamic>toJson(){
    return {
      "tools":tools,
      "name":name,
      "id":id,
      "isCheck":isCheck,
    };
  }

}