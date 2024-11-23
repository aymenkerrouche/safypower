import 'package:data_table_2/data_table_2.dart';
import 'package:fintech_dashboard_clone/widgets/switch_botton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fintech_dashboard_clone/layout/profile_layout.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/users_json.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController searchController = TextEditingController();
  List searchedUser = users;
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 1000;

    return Scaffold(
      body: SafeArea(
        child: ProfileLayout(
          content: Padding(
            padding: isMobile
                ? const EdgeInsets.all(0)
                : const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Utilisateurs',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (!isMobile)
                          IconButton(
                            onPressed: () {
                              _showSettingsDialog(context);
                            },
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.white),
                            icon: SvgPicture.asset(
                              'assets/svg/settings.svg',
                              width: 26,
                              colorFilter: const ColorFilter.mode(
                                  Colors.black, BlendMode.srcIn),
                            ),
                          ),
                        const SizedBox(
                          width: 20,
                        ),
                        if (!isMobile)
                          Stack(
                            children: [
                              IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                    backgroundColor: Colors.white),
                                icon: SvgPicture.asset(
                                  'assets/svg/notif.svg',
                                  width: 26,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: maxWidth,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: (v) {
                      if (searchController.text.isNotEmpty) {
                        setState(() {
                          searchedUser = users
                              .where((user) =>
                                  user["id"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchController.text) ||
                                  user["nom"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchController.text) ||
                                  user["prenom"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchController.text) ||
                                  user["email"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchController.text) ||
                                  user["phone"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchController.text) ||
                                  user["statut"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchController.text) ||
                                  user["chargingTimes"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchController.text))
                              .toList();
                        });
                      } else {
                        setState(() {
                          searchedUser = users;
                        });
                      }
                      ;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Search something...",
                        icon: Icon(CupertinoIcons.search),
                        border: InputBorder.none,
                        suffixIcon: IconButton(onPressed: () {setState(() {searchController.clear();searchedUser = users;});}, icon: Icon(Icons.close,))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                      ),
                      child: usersWidget(context, searchedUser)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//******************************************************** */

Widget usersWidget(context, newUsers) {
  Size size = MediaQuery.of(context).size;
  return Container(
    padding: const EdgeInsets.only(right: 24, left: 24, bottom: 12),
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: DataTable2(
      minWidth: 1000,
      horizontalMargin: 0,
      columnSpacing: 10,
      bottomMargin: 10,
      columns: [
        DataColumn2(
          fixedWidth: 60,
          label: Text(
            "ID",
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn2(
          fixedWidth: size.width < 800 ? 150 : size.width * 0.13,
          label: Text(
            "Nom",
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn2(
          label: Text(
            "Email",
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          size: ColumnSize.L,
        ),
        DataColumn2(
            label: Text(
              "Phone",
              style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            size: ColumnSize.S),
        DataColumn2(
          label: Text(
            "N° de charges",
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: Text(
            "Status",
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          fixedWidth: 80,
        ),
        DataColumn2(
          label: Text(
            "Actions",
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          fixedWidth: 80,
        ),
      ],
      rows: List.generate(
        newUsers.length,
        (index) => userDataRow(newUsers[index], context),
      ),
    ),
  );
}

DataRow userDataRow(Map<String, dynamic> userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Container(
          child: Text(
            "${userInfo["id"]}",
            maxLines: 1,
            style: GoogleFonts.montserrat(color: const Color(0xFF010483), fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        Expanded(
          child: Text(
            "${userInfo["nom"]} ${userInfo["prenom"]}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500),

          ),
        ),
      ),
      DataCell(Row(
        children: [
          Icon(Icons.mail_outline_rounded,color: const Color(0xFF010483)),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Text(
              "${userInfo["email"]}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      )),
      DataCell(Row(
        children: [
          Icon(Icons.phone_rounded,  color: const Color(0xFF010483)),
          SizedBox(
            width: 6,
          ),
          Text(
            "${userInfo["phone"]}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      )),
      DataCell(Container(
          child: Text(
        "${userInfo["chargingTimes"]}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500),
      ))),
      DataCell(IconButton(
          onPressed: () {},
          icon: Icon(
              userInfo["statut"] == "actif"
                  ? Icons.circle
                  : Icons.block_rounded,
              color:
                  userInfo["statut"] == "actif" ? CupertinoColors.activeGreen : CupertinoColors.systemRed))),
      DataCell(TextButton(
        child: const Icon(
          Icons.delete_rounded,
          color: Colors.red,
        ),
        onPressed: () {},
      )),
    ],
  );
}




void _showSettingsDialog(BuildContext context) {
  final isMobile = MediaQuery.of(context).size.width < 600;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: isMobile ? MediaQuery.of(context).size.width * 0.8 : 1100,
          height: 650,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: isMobile
                    ? const EdgeInsets.only(right: 15)
                    : const EdgeInsets.only(right: 35, top: 15),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    size: isMobile ? 40 : 60,
                  ),
                ),
              ),
              Container(
                height:
                    isMobile ? MediaQuery.of(context).size.height * 0.75 : 480,
                padding: isMobile
                    ? const EdgeInsets.only(
                        left: 10, right: 0, top: 10, bottom: 10)
                    : const EdgeInsets.only(
                        left: 45, right: 0, top: 35, bottom: 35),
                margin: isMobile
                    ? const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 0)
                    : const EdgeInsets.only(
                        left: 70, right: 70, top: 35, bottom: 0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 246, 254, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Settings',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 18 : 24,
                          height: 1.21,
                        ),
                      ),
                      const SizedBox(height: 17),
                      Row(
                        children: [
                          CustomSwitch(
                            value: true,
                            onChanged: (bool value) {},
                          ),
                          SizedBox(width: isMobile ? 20 : 50),
                          Flexible(
                            child: Text(
                              'Receiving notifications immediately.',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          CustomSwitch(
                            value: false,
                            onChanged: (bool value) {},
                          ),
                          SizedBox(width: isMobile ? 20 : 50),
                          Flexible(
                            child: Text(
                              'Email me when my account is accessed from a new device.',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      _buildSettingsOption(
                        context,
                        icon: Icons.lock,
                        text: 'Change Password',
                        onTap: () {
                          // Add change password functionality here
                        },
                      ),
                      const SizedBox(height: 28),
                      _buildSettingsOption(
                        context,
                        icon: Icons.delete_forever,
                        text: 'Deactivate Account',
                        onTap: () {
                          // Add deactivate account functionality here
                        },
                      ),
                      const SizedBox(height: 28),
                      _buildSettingsOption(
                        context,
                        icon: Icons.language,
                        text: 'Change Language',
                        onTap: () {
                          // Add change language functionality here
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildSettingsOption(BuildContext context,
    {required IconData icon, required String text, required Function() onTap}) {
  final isMobile = MediaQuery.of(context).size.width < 600;

  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Icon(
          icon,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 20 : 50),
        Flexible(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
        ),
      ],
    ),
  );
}

