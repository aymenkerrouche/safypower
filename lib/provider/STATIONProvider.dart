// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../data/casier_model.dart';
import '../data/station_model.dart';
import '../data/stations_json.dart';

class STATIONProvider extends ChangeNotifier {

  Station? _currentStation;
  List<Station> _mesStation = [];

  Station? get currentStation => _currentStation;
  List<Station> get mesStation => _mesStation;



  void getStation(String id) {
    _currentStation = _mesStation.firstWhere((station) => station.id == id);
    notifyListeners(); 
  }

  getStations() {
    clear();
    for (var station in stations) {
      mesStation.add(Station.fromMap(station as Map<String, dynamic>));
    }
  }
  
  void turnOnOffCurrentStation(String id, bool isOn) {
    if (_currentStation != null) {
      _mesStation.firstWhere((station) => station.id == id).isOn = isOn;
      _currentStation!.isOn = isOn;
      turnOnOffLesPrise(id, isOn);
      notifyListeners(); 
    }
  }


  

  clear() {
    mesStation.clear();
  }

  turnOnOffLesPrise(String stationID, bool isOn) {
    for (Casier casier in mesStation .where((element) => element.id == stationID).first.casier!) {
      casier.isPriseOn = isOn;
      casier.isCapteurOn = isOn;
    }
  }





  void togglePrise(String casierId, bool isOn) {
    final casier = currentStation?.casier?.firstWhere(
      (c) => c.id == casierId,
    );

    if (casier != null) {
      casier.isPriseOn = isOn; 
      notifyListeners(); 
    }
  }

  void toggleCapteur(String casierId, bool isOn) {
    final casier = currentStation?.casier?.firstWhere(
      (c) => c.id == casierId,);

    if (casier != null) {
      casier.isCapteurOn = isOn;
      notifyListeners(); 
    }
  }










  // temperature
  Timer? _temperatureTimer;

  // Random temperature chaque 3s
  void startTemperatureUpdates() {
    Random random = Random();

    _temperatureTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      for (Station station in _mesStation) {
        for (Casier casier in station.casier!) {
          casier.temperature = 10 + random.nextDouble() * 40; // Entre 10 ° and 50 ° pcq j'ai pas des données reels
        }
      }
      notifyListeners();
    });
  }

  // Stop
  void stopTemperatureUpdates() {
    _temperatureTimer?.cancel();
    _temperatureTimer = null;
  }

  @override
  void dispose() {
    stopTemperatureUpdates();
    super.dispose();
  }


}
