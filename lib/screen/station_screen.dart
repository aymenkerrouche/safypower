import 'package:fintech_dashboard_clone/data/casier_model.dart';
import 'package:fintech_dashboard_clone/data/station_model.dart';
import 'package:fintech_dashboard_clone/layout/station_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/STATIONProvider.dart';
import '../styles/styles.dart';
import '../widgets/alert_fire.dart';
import '../widgets/statistique_widgets/bar_chart_with_title.dart';

class StationScreen extends StatefulWidget {
  const StationScreen({Key? key}) : super(key: key);

  @override
  State<StationScreen> createState() => _StationScreenState();
}

class _StationScreenState extends State<StationScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = context.read<STATIONProvider>();
      provider.getStation("1");
      provider.startTemperatureUpdates();
    });
  }

  @override
  void dispose() {
    context.read<STATIONProvider>().stopTemperatureUpdates();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StataionLayout(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              currentStation(context),
              const SizedBox(height: 20),
              Expanded(child: lesCasiers(context),),
              
            ],
          ),
        ),
      ),
    );
  }

  

  Widget lesCasiers(BuildContext context) {
  return Consumer<STATIONProvider>(
    builder: (context, stationProvider, child) {
      if (stationProvider.currentStation == null) {
        return const Center(
          child: Text(
            "Aucune station sélectionnée",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );
      }

      final casiers = stationProvider.currentStation!.casier;

      if (casiers == null || casiers.isEmpty) {
        return const Center(
          child: Text(
            "Aucun casier disponible pour cette station.",
            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
          ),
        );
      }

      final screenWidth = MediaQuery.of(context).size.width;

      // Determine the number of items per row based on screen width
      int crossAxisCount;
      if (screenWidth < 720) {
        crossAxisCount = 1; // Mobile
      } else if (screenWidth < 1200) {
        crossAxisCount = 2; // Tablet
      } else {
        crossAxisCount = 3; // Desktop
      }

      return Container(
        padding: const EdgeInsets.all(8),
        child: crossAxisCount == 1 ?
        SingleChildScrollView(
          child: Column(
            children: List.generate(casiers.length, (index) => unCasier(context, casiers[index])),
          ),
        ):
        GridView.count(
          crossAxisCount: crossAxisCount,
          physics: const BouncingScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 6/4 ,
          children : List.generate(casiers.length, (index) => unCasier(context, casiers[index])),
        ),
      );
    },
  );
}

  Widget unCasier(BuildContext context, Casier casier) {
  return Consumer<STATIONProvider>(
    builder: (context, provider, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            // Casier ID
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                "${casier.id}".substring(2),
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),

            // Prise
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  tooltip: "ON/OFF",
                  onPressed: () {},
                  style: IconButton.styleFrom(backgroundColor: Styles.defaultLightWhiteColor),
                  icon: Image.asset(
                    "assets/icons/power.png",
                    height: 26,
                    width: 26,
                    color: casier.isPriseOn! ? Colors.teal : Colors.black87,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  casier.isPriseOn! ? "Prise alimentée" : "Prise hors tension",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),
                

                Switch(
                  activeColor: Colors.teal,
                  inactiveThumbColor: Colors.teal.shade200,
                  inactiveTrackColor: Colors.white,
                  value: casier.isPriseOn!,
                  onChanged: (bool value) {
                    context.read<STATIONProvider>().togglePrise(casier.id!, value);
                  },
                  trackOutlineColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.transparent;
                      }
                      return Colors.teal.shade200;
                    },
                  ),
                ),

              ],
            ),

            const SizedBox(height: 12),

            // Température
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  tooltip: "ON/OFF",
                  style: IconButton.styleFrom(backgroundColor: Styles.defaultLightWhiteColor),
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/icons/thermometer.png",
                    height: 26,
                    width: 26,
                    color: casier.isCapteurOn! ? casier.temperature! > 30 ? Colors.red : Colors.amber : Colors.black87,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "${casier.temperature!.toStringAsFixed(1)} °C",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                Switch(
                  activeColor: Colors.teal,
                  inactiveThumbColor: Colors.teal.shade200,
                  inactiveTrackColor: Colors.white,
                  value: casier.isCapteurOn!,
                  onChanged: (bool value) {
                    context.read<STATIONProvider>().toggleCapteur(casier.id!, value);
                  },
                  trackOutlineColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.transparent;
                      }
                      return Colors.teal.shade200;
                    },
                  ),
                ),




              ],
            ),

            const SizedBox(height: 12),

            // Le détecteur de fumée
             Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  tooltip: "L’alarme incendie",
                  style: IconButton.styleFrom(backgroundColor: Styles.defaultLightWhiteColor),
                  onPressed: () {},
                  icon: Icon(
                    casier.isSmokeDetected! ? Icons.local_fire_department_rounded : Icons.health_and_safety_rounded,
                    size: 26,
                    color: casier.isSmokeDetected! ? Colors.red : Colors.teal,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Détecteur de fumée",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                if(casier.isSmokeDetected!)IconButton(
                  tooltip: "L’alarme incendie",
                  
                  onPressed: () async {await alertFire(context, casier.stationId!, casier.id!);},
                  icon: Image.asset(
                  "assets/icons/attention.png",
                  height: 26,
                  width: 26,
                )
                ),
                
                const SizedBox(width: 8),
              ],
            ),
             const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}

  Widget currentStation(BuildContext context) {
    final stationProvider = Provider.of<STATIONProvider>(context);
    if (stationProvider.currentStation == null) {
      return const CircularProgressIndicator();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // STATION
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
          child: DropdownButton<Station>(
            value: stationProvider.currentStation,
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: Colors.black,
            ),
            elevation: 16,
            borderRadius: BorderRadius.circular(20),
            underline: const SizedBox(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
            onChanged: (Station? newStation) {
              stationProvider.getStation(newStation!.id!);
            },
            items: stationProvider.mesStation
                .map<DropdownMenuItem<Station>>((Station value) {
              return DropdownMenuItem<Station>(
                value: value,
                child: Text(
                  value.name!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        // bouton ON/OFF permettant d’éteindre ou d’allumer toutes les prises de la station
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Text(
                  context.watch<STATIONProvider>().currentStation!.isOn!
                      ? "ON"
                      : "OFF",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Switch(
                  activeColor: Colors.teal,
                  inactiveThumbColor: Colors.teal.shade200,
                  inactiveTrackColor: Colors.white,
                  value: context.watch<STATIONProvider>().currentStation!.isOn!,
                  onChanged: (bool value) {
                    context
                        .read<STATIONProvider>()
                        .turnOnOffCurrentStation(stationProvider.currentStation!.id!, value);
                  },
                  trackOutlineColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.transparent;
                      }
                      return Colors.teal.shade200;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
