import 'package:fintech_dashboard_clone/widgets/statistique_widgets/bar_chart_with_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../provider/STATIONProvider.dart';

class ExpenseIncomeCharts extends StatelessWidget {
  const ExpenseIncomeCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;

    return !isMobile
        ? Row(
            children: [
              Flexible(
                child: currentUse() 
              ),
              const SizedBox(
                width: 30,
              ),
              Flexible(
                child: averageTime()
              ),
            ],
          )
        : Column(
            children: [
              Flexible(
                child: currentUse()
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: averageTime(),
              ),
            ],
          );
  }

  Widget currentUse(){
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
        return Container(
          padding: const EdgeInsets.all(8),
          child: BarChartStation(data: context.read<STATIONProvider>().currentStation!.casier!,titre: "Taux d'utilisation des casiers",type: 1),
          );
      },
    );
  }
  
  Widget averageTime(){
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
        return Container(
          padding: const EdgeInsets.all(8),
          child: BarChartStation(data: context.read<STATIONProvider>().currentStation!.casier!,titre: "Temps moyen d'utilisation",type: 2),
          );
      },
    );
  }

}
