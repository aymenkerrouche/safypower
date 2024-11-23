import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/STATIONProvider.dart';

alertFire(context, String stationID, String casierID) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: Colors.white,
        actionsAlignment: MainAxisAlignment.center,
        icon: const Icon(
          Icons.local_fire_department,
          size: 40,
        ),
        iconColor: Colors.red,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: const Text("L'alarme incendie"),
        content: Text(
            "un incendie a été détecté dans la station $stationID, casier: $casierID "),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.read<STATIONProvider>().togglePrise(casierID, false);
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                side: BorderSide(width: 2, color: Colors.teal.shade700),
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Éteindre la prise",
                  style: TextStyle(color: Colors.teal.shade700, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.battery_charging_full_rounded,
                  color: Colors.teal.shade700,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<STATIONProvider>()
                  .turnOnOffCurrentStation(stationID, false);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.red.shade700),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Éteindre la station",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.grid_view_rounded,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
        actionsOverflowButtonSpacing: 20,
      );
    },
  );
}
