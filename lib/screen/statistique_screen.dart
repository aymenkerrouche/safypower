import 'package:flutter/material.dart';
import 'package:fintech_dashboard_clone/sections/statistique_section/statistics.dart';
import 'package:fintech_dashboard_clone/sections/statistique_section/last_users_map.dart';
import 'package:fintech_dashboard_clone/layout/statistique_layout.dart';
import 'package:fintech_dashboard_clone/sections/statistique_section/expense_income_chart.dart';
import 'package:provider/provider.dart';

import '../provider/STATIONProvider.dart';
import '../widgets/statistique_widgets/bar_chart_with_title.dart';

class Statistique extends StatefulWidget {
  const Statistique({Key? key}) : super(key: key);

  @override
  State<Statistique> createState() => _StatistiqueState();
}

class _StatistiqueState extends State<Statistique> {

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
    Size  size = MediaQuery.of(context).size;
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;

    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Row(
              children: [
                // Main Panel
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 0, right: 20),
                    child: Column(
                      children: [
                        
                        SizedBox(
                          height: isMobile ? size.height * 0.6 : size.height * 0.35,
                          child: const ExpenseIncomeCharts(),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        
                        
                        SizedBox(
                          height: size.height * 0.5,
                          child: const StatisticsCharts(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          height: size.height * 0.6,
                          child: const LastUsersMap(),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
