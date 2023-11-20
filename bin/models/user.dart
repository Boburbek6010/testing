import 'dart:convert';
//
// Car fromCarCloud(String data) => Car.fromJson(jsonDecode(data));
//
// String toCarCloud(Car car) => jsonEncode(car.toJson());


Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final String greeting;
  final List<List<String>> instructions;

  Welcome({
    required this.greeting,
    required this.instructions,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    greeting: json["greeting"],
    instructions: List<List<String>>.from(json["instructions"].map((x) {
      if (x is List) {
        return List<String>.from(x.map((y) => y.toString()));
      } else {
        return [x.toString()];
      }
    },),),
  );

  Map<String, dynamic> toJson() => {
    "greeting": greeting,
    "instructions": List<dynamic>.from(
      instructions.map(
            (x) => List<dynamic>.from(x.map((y) => y)),
      ),
    ),
  };
}







abstract class A{

  late List<String> tools;
  String? address;
  late int _id;

  A(this.tools);

  int get id => _id;

  set setId(int id) => _id = id;

  void build();


  Stream<String>destroy(List<String> tools);


}




class Car extends A{
  late String name;
  late int numberOfDoors;

  late List<String> tool;

  @override
  late int _id;

  Car(this.tool) : super(tool);

  @override
  void build() {

  }

  @override
  Stream<String> destroy(tool) async*{
    yield "Please be patient building...\n";
    for(int i = 0; i < tool.length; i++){
      yield tool[i];
      await Future.delayed(Duration(seconds: 2));
      tool.remove(tool[i]);
    }
    yield "\nTAYYOR";
  }
}
