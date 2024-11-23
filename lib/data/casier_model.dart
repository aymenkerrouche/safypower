class Casier {
  String? id;
  String? stationId;
  bool? isPriseOn;
  bool? isCapteurOn;
  bool? isSmokeDetected;
  double? temperature;
  double? tauxUtilisation;
  Duration? tempsMoyen;

  Casier.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    stationId = data["stationId"];
    isPriseOn = data["isPriseOn"];
    isCapteurOn = data["isCapteurOn"];
    temperature = data["temperature"];
    isSmokeDetected = data["isSmokeDetected"];
    tauxUtilisation= data["tauxUtilisation"];
    tempsMoyen= data["tempsMoyen"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stationId': stationId,
      'isPriseOn': isPriseOn,
      'isCapteurOn': isCapteurOn,
      'temperature': temperature,
      'isSmokeDetected' : isSmokeDetected,
      'tauxUtilisation' : tauxUtilisation,
      'tempsMoyen' : tempsMoyen,
    };
  }
}
