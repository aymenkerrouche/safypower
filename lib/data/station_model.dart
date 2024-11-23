import 'casier_model.dart';

class Station {
  String? id;
  String? name;
  List<Casier>? casier;
  bool? isOn;

  Station.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    name = data["name"];
    isOn = data["isOn"];
     casier = (data["casier"] as List<dynamic>)
        .map((map) => Casier.fromMap(map as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isOn': isOn,
      //'casier': casier!.map((i) => i.toMap()).toList(),
    };
  }
}
