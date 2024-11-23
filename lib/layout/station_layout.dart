import 'package:fintech_dashboard_clone/layout/navigation_panel.dart';
import 'package:fintech_dashboard_clone/models/enums/navigation_items.dart';
import 'package:fintech_dashboard_clone/responsive.dart';
import 'package:flutter/cupertino.dart';

class StataionLayout extends StatelessWidget {
  final Widget content;

  const StataionLayout({Key? key, required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: content,
            ),
          ),
          const NavigationPanel(
            axis: Axis.horizontal,
            activeTab: NavigationItems.station,
          ),
        ],
      ),
      desktop: Row(
        children: [
          const NavigationPanel(
            axis: Axis.vertical,
            activeTab: NavigationItems.station,
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 20.0),
              child: content,
            ),
          ),
        ],
      ),
    );
  }
}
