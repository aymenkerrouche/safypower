import 'package:fintech_dashboard_clone/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../data/station_model.dart';
import '../provider/STATIONProvider.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Visibility(
                visible: Responsive.isDesktop(context),
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text(
                    "SafyPower",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Search something...",
                      icon: Icon(CupertinoIcons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              _nameAndProfilePicture(
                context,
                "Aymen KERROUCHE",
                "https://media.licdn.com/dms/image/v2/D4D03AQFayq9gXKBlAA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1726692387150?e=1736985600&v=beta&t=FP7JzzKnihP5ca4Io7u1ARA8zKjE87moa5edS1X1Fqo",
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 10, bottom: 0),
            child: currentStation(context),
          ),
        ],
      ),
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
                    context.read<STATIONProvider>().turnOnOffCurrentStation(
                        stationProvider.currentStation!.id!, value);
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

  Widget _nameAndProfilePicture(
      BuildContext context, String username, String imageUrl) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          username,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 6.0),
          child: Icon(
            CupertinoIcons.chevron_down,
            size: 14,
          ),
        ),
        Visibility(
          visible: !Responsive.isMobile(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
        ),
      ],
    );
  }
}
