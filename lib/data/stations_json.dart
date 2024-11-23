
const stations = [
  {
    "id": "1",
    "name": "Station 1",
    "casier": [
      {"id": "1-1", "stationId": "1", "isPriseOn": true, "isCapteurOn": false, "temperature": 25.5, "isSmokeDetected" : false,  "tauxUtilisation": 1.0, "tempsMoyen" : Duration(hours: 3, minutes: 30)},
      {"id": "1-2", "stationId": "1", "isPriseOn": false, "isCapteurOn": true, "temperature": 28.3, "isSmokeDetected" : false,  "tauxUtilisation": 24.0, "tempsMoyen" : Duration(hours: 5, minutes: 30)},
      {"id": "1-3", "stationId": "1", "isPriseOn": true, "isCapteurOn": true, "temperature": 22.7, "isSmokeDetected" : false,  "tauxUtilisation": 4.0, "tempsMoyen" : Duration(hours: 1, minutes: 30)},
      {"id": "1-4", "stationId": "1", "isPriseOn": false, "isCapteurOn": false, "temperature": 30.1, "isSmokeDetected" : false,  "tauxUtilisation": 20.0, "tempsMoyen" : Duration(hours: 6, minutes: 30)},
      {"id": "1-5", "stationId": "1", "isPriseOn": true, "isCapteurOn": false, "temperature": 19.8, "isSmokeDetected" : false,  "tauxUtilisation": 2.0, "tempsMoyen" : Duration(hours: 3, minutes: 30)},
      {"id": "1-6", "stationId": "1", "isPriseOn": false, "isCapteurOn": true, "temperature": 35.2, "isSmokeDetected" : true,  "tauxUtilisation": 4.0, "tempsMoyen" : Duration(hours: 4, minutes: 30)}
    ],
    "isOn": true
  },
  {
    "id": "2",
    "name": "Station 2",
    "casier": [
      {"id": "2-1", "stationId": "2", "isPriseOn": false, "isCapteurOn": true, "temperature": 26.4, "isSmokeDetected" : false,  "tauxUtilisation": 5.0, "tempsMoyen" : Duration(hours: 3, minutes: 20)},
      {"id": "2-2", "stationId": "2", "isPriseOn": true, "isCapteurOn": false, "temperature": 24.5, "isSmokeDetected" : true,  "tauxUtilisation": 6.0, "tempsMoyen" : Duration(hours: 2, minutes: 11)},
      {"id": "2-3", "stationId": "2", "isPriseOn": true, "isCapteurOn": true, "temperature": 27.1, "isSmokeDetected" : false,  "tauxUtilisation": 5.0, "tempsMoyen" : Duration(hours: 3, minutes: 43)},
      {"id": "2-4", "stationId": "2", "isPriseOn": false, "isCapteurOn": false, "temperature": 23.3, "isSmokeDetected" : false,  "tauxUtilisation": 34.0, "tempsMoyen" : Duration(hours: 4, minutes: 30)},
      {"id": "2-5", "stationId": "2", "isPriseOn": true, "isCapteurOn": false, "temperature": 29.0, "isSmokeDetected" : false,  "tauxUtilisation": 7.0, "tempsMoyen" : Duration(hours: 1, minutes: 40)},
      {"id": "2-6", "stationId": "2", "isPriseOn": false, "isCapteurOn": true, "temperature": 32.1, "isSmokeDetected" : false,  "tauxUtilisation": 8.0, "tempsMoyen" : Duration(hours: 2, minutes: 33)}
    ],
    "isOn": true
  },
  {
    "id": "3",
    "name": "Station 3",
    "casier": [
      {"id": "3-1", "stationId": "3", "isPriseOn": true, "isCapteurOn": true, "temperature": 25.5, "isSmokeDetected" : false,  "tauxUtilisation": 3.0, "tempsMoyen" : Duration(hours: 3, minutes: 40)},
      {"id": "3-2", "stationId": "3", "isPriseOn": false, "isCapteurOn": false, "temperature": 23.7, "isSmokeDetected" : false,  "tauxUtilisation": 7.0, "tempsMoyen" : Duration(hours: 2, minutes: 30)},
      {"id": "3-3", "stationId": "3", "isPriseOn": true, "isCapteurOn": false, "temperature": 22.1, "isSmokeDetected" : true,  "tauxUtilisation": 3.0, "tempsMoyen" : Duration(hours: 3, minutes: 44)},
      {"id": "3-4", "stationId": "3", "isPriseOn": false, "isCapteurOn": true, "temperature": 28.9, "isSmokeDetected" : false,  "tauxUtilisation": 4.0, "tempsMoyen" : Duration(hours: 5, minutes: 10)},
      {"id": "3-5", "stationId": "3", "isPriseOn": true, "isCapteurOn": false, "temperature": 21.5, "isSmokeDetected" : false,  "tauxUtilisation": 6.0, "tempsMoyen" : Duration(hours: 2, minutes: 30)},
      {"id": "3-6", "stationId": "3", "isPriseOn": false, "isCapteurOn": true, "temperature": 30.2, "isSmokeDetected" : false,  "tauxUtilisation": 3.0, "tempsMoyen" : Duration(hours: 3, minutes: 20)}
    ],
    "isOn": true
  },
  {
    "id": "4",
    "name": "Station 4",
    "casier": [
      {"id": "4-1", "stationId": "4", "isPriseOn": false, "isCapteurOn": false, "temperature": 26.5, "isSmokeDetected" : false,  "tauxUtilisation": 6.0, "tempsMoyen" : Duration(hours: 2, minutes: 40)},
      {"id": "4-2", "stationId": "4", "isPriseOn": false, "isCapteurOn": false, "temperature": 27.6, "isSmokeDetected" : false,  "tauxUtilisation": 3.0, "tempsMoyen" : Duration(hours: 3, minutes: 30)},
      {"id": "4-3", "stationId": "4", "isPriseOn": false, "isCapteurOn": false, "temperature": 28.1, "isSmokeDetected" : false,  "tauxUtilisation": 5.0, "tempsMoyen" : Duration(hours: 5, minutes: 20)},
      {"id": "4-4", "stationId": "4", "isPriseOn": false, "isCapteurOn": false, "temperature": 22.8, "isSmokeDetected" : false,  "tauxUtilisation": 33.0, "tempsMoyen" : Duration(hours: 3, minutes: 30)},
      {"id": "4-5", "stationId": "4", "isPriseOn": false, "isCapteurOn": false, "temperature": 23.4, "isSmokeDetected" : false,  "tauxUtilisation": 3.0, "tempsMoyen" : Duration(hours: 3, minutes: 50)},
      {"id": "4-6", "stationId": "4", "isPriseOn": false, "isCapteurOn": false, "temperature": 20.7, "isSmokeDetected" : false,  "tauxUtilisation": 6.0, "tempsMoyen" : Duration(hours: 5, minutes: 33)}
    ],
    "isOn": false
  },
  {
    "id": "5",
    "name": "Station 5",
    "casier": [
      {"id": "5-1", "stationId": "5", "isPriseOn": true, "isCapteurOn": false, "temperature": 24.3, "isSmokeDetected" : false,  "tauxUtilisation": 15.0, "tempsMoyen" : Duration(hours: 2, minutes: 34)},
      {"id": "5-2", "stationId": "5", "isPriseOn": false, "isCapteurOn": true, "temperature": 29.4, "isSmokeDetected" : false,  "tauxUtilisation": 9.0, "tempsMoyen" : Duration(hours: 2, minutes: 35)},
      {"id": "5-3", "stationId": "5", "isPriseOn": true, "isCapteurOn": true, "temperature": 25.2, "isSmokeDetected" : false,  "tauxUtilisation": 12.0, "tempsMoyen" : Duration(hours: 3, minutes: 30)},
      {"id": "5-4", "stationId": "5", "isPriseOn": false, "isCapteurOn": false, "temperature": 22.9, "isSmokeDetected" : false,  "tauxUtilisation": 3.0, "tempsMoyen" : Duration(hours: 4, minutes: 22)},
      {"id": "5-5", "stationId": "5", "isPriseOn": true, "isCapteurOn": false, "temperature": 21.7, "isSmokeDetected" : false,  "tauxUtilisation": 42.0, "tempsMoyen" : Duration(hours: 3, minutes: 30)},
      {"id": "5-6", "stationId": "5", "isPriseOn": false, "isCapteurOn": true, "temperature": 27.5, "isSmokeDetected" : false,  "tauxUtilisation": 2.0, "tempsMoyen" : Duration(hours: 1, minutes: 54)}
    ],
    "isOn": true
  },
  {
    "id": "6",
    "name": "Station 6",
    "casier": [
      {"id": "6-1", "stationId": "6", "isPriseOn": false, "isCapteurOn": true, "temperature": 24.0, "isSmokeDetected" : false,  "tauxUtilisation": 4.0, "tempsMoyen" : Duration(hours: 1, minutes: 5)},
      {"id": "6-2", "stationId": "6", "isPriseOn": true, "isCapteurOn": false, "temperature": 26.2, "isSmokeDetected" : false,  "tauxUtilisation": 2.0, "tempsMoyen" : Duration(hours: 3, minutes: 34)},
      {"id": "6-3", "stationId": "6", "isPriseOn": false, "isCapteurOn": true, "temperature": 29.3, "isSmokeDetected" : false,  "tauxUtilisation": 5.0, "tempsMoyen" : Duration(hours: 2, minutes: 30)},
      {"id": "6-4", "stationId": "6", "isPriseOn": true, "isCapteurOn": false, "temperature": 25.8, "isSmokeDetected" : false,  "tauxUtilisation": 6.0, "tempsMoyen" : Duration(hours: 2, minutes: 44)},
      {"id": "6-5", "stationId": "6", "isPriseOn": true, "isCapteurOn": true, "temperature": 27.2, "isSmokeDetected" : true,  "tauxUtilisation": 8.0, "tempsMoyen" : Duration(hours: 5, minutes: 33)},
      {"id": "6-6", "stationId": "6", "isPriseOn": false, "isCapteurOn": false, "temperature": 22.6, "isSmokeDetected" : false,  "tauxUtilisation": 5.0, "tempsMoyen" : Duration(hours: 4, minutes: 14)}
    ],
    "isOn": true
  },
  {
    "id": "7",
    "name": "Station 7",
    "casier": [
      {"id": "7-1", "stationId": "7", "isPriseOn": true, "isCapteurOn": true, "temperature": 27.3, "isSmokeDetected" : false,  "tauxUtilisation": 8.0, "tempsMoyen" : Duration(hours: 2, minutes: 30)},
      {"id": "7-2", "stationId": "7", "isPriseOn": false, "isCapteurOn": false, "temperature": 25.0, "isSmokeDetected" : false,  "tauxUtilisation": 17.0, "tempsMoyen" : Duration(hours: 8, minutes: 55)},
      {"id": "7-3", "stationId": "7", "isPriseOn": true, "isCapteurOn": false, "temperature": 28.1, "isSmokeDetected" : false,  "tauxUtilisation": 13.0, "tempsMoyen" : Duration(hours: 3, minutes: 54)},
      {"id": "7-4", "stationId": "7", "isPriseOn": false, "isCapteurOn": true, "temperature": 30.2, "isSmokeDetected" : false,  "tauxUtilisation": 5.0, "tempsMoyen" : Duration(hours: 6, minutes: 30)},
      {"id": "7-5", "stationId": "7", "isPriseOn": true, "isCapteurOn": false, "temperature": 26.7, "isSmokeDetected" : false,  "tauxUtilisation": 8.0, "tempsMoyen" : Duration(hours: 2, minutes: 44)},
      {"id": "7-6", "stationId": "7", "isPriseOn": false, "isCapteurOn": true, "temperature": 31.4, "isSmokeDetected" : false,  "tauxUtilisation": 7.0, "tempsMoyen" : Duration(hours: 3, minutes: 20)}
    ],
    "isOn": true
  },
  {
    "id": "8",
    "name": "Station 8",
    "casier": [
      {"id": "8-1", "stationId": "8", "isPriseOn": false, "isCapteurOn": true, "temperature": 25.6, "isSmokeDetected" : true,  "tauxUtilisation": 9.0, "tempsMoyen" : Duration(hours: 6, minutes: 30)},
      {"id": "8-2", "stationId": "8", "isPriseOn": true, "isCapteurOn": false, "temperature": 29.0, "isSmokeDetected" : false,  "tauxUtilisation": 8.0, "tempsMoyen" : Duration(hours: 3, minutes: 16)},
      {"id": "8-3", "stationId": "8", "isPriseOn": false, "isCapteurOn": true, "temperature": 24.8, "isSmokeDetected" : false,  "tauxUtilisation": 5.0, "tempsMoyen" : Duration(hours: 3, minutes: 28)},
      {"id": "8-4", "stationId": "8", "isPriseOn": true, "isCapteurOn": false, "temperature": 26.4, "isSmokeDetected" : false,  "tauxUtilisation": 4.0, "tempsMoyen" : Duration(hours: 2, minutes: 46)},
      {"id": "8-5", "stationId": "8", "isPriseOn": true, "isCapteurOn": true, "temperature": 28.3, "isSmokeDetected" : false,  "tauxUtilisation": 18.0, "tempsMoyen" : Duration(hours: 5, minutes: 30)},
      {"id": "8-6", "stationId": "8", "isPriseOn": false, "isCapteurOn": false, "temperature": 27.1, "isSmokeDetected" : false,  "tauxUtilisation": 7.0, "tempsMoyen" : Duration(hours: 7, minutes: 04)}
    ],
    "isOn": true
  }
];
