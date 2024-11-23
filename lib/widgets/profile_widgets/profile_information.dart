import 'package:fintech_dashboard_clone/widgets/switch_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: isMobile ? 24 : 30,
                  backgroundImage: const AssetImage('assets/logo.png'),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: isMobile ? 20 : 24,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    SizedBox(
                      height: isMobile ? 10 : 15,
                    ),
                    Text(
                      email,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: isMobile ? 14 : 16,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ],
                ),
              
                Expanded( 
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/edit.svg',
                      width: 16,
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(height: 1),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _showProfileSettingDialog(context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      isMobile ? 'settings' : 'Profile settings',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: (isMobile ||
                                (600 <= MediaQuery.of(context).size.width &&
                                    MediaQuery.of(context).size.width <= 1118))
                            ? 14
                            : 20,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _showProfileInformationDialog(context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                     'informations' ,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: (isMobile ||
                                (600 <= MediaQuery.of(context).size.width &&
                                    MediaQuery.of(context).size.width <= 1000))
                            ? 14
                            : 20,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showProfileSettingDialog(BuildContext context) {
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
            height: isMobile ? 500 : 650,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    margin: isMobile
                        ? const EdgeInsets.only(right: 15)
                        : const EdgeInsets.only(right: 35),
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
                    padding: isMobile
                        ? const EdgeInsets.all(10)
                        : const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 35),
                    margin: isMobile
                        ? const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: 20) // Adjust the padding here
                        : const EdgeInsets.only(
                            left: 70, right: 70, top: 50, bottom: 0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 246, 254, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Platform Settings',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 18 : 24,
                            height: 1.21,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Account',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
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
                                'Email me when someone follows me.',
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
                            const Flexible(
                              child: Text(
                                  'Email me when someone answers my post.'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Row(
                          children: [
                            CustomSwitch(
                              value: true,
                              onChanged: (bool value) {},
                            ),
                            SizedBox(width: isMobile ? 20 : 50),
                            const Flexible(
                              child: Text('Email me when someone mentions me.'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Application',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: isMobile ? 18 : 24,
                            height: 1.21,
                          ),
                        ),
                        const SizedBox(height: 17),
                        Row(
                          children: [
                            CustomSwitch(
                              value: false,
                              onChanged: (bool value) {},
                            ),
                            SizedBox(width: isMobile ? 20 : 50),
                            Flexible(
                              child: Text(
                                'New launches and projects.',
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
                                'Monthly product changes.',
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
                              value: true,
                              onChanged: (bool value) {},
                            ),
                            SizedBox(width: isMobile ? 20 : 50),
                            Flexible(
                              child: Text(
                                'Subscribe to the newsletter.',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: isMobile ? 14 : 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //*********************profile information dialog */
  void _showProfileInformationDialog(BuildContext context) {
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
            height: isMobile ? 500 : 650,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    margin: isMobile
                        ? const EdgeInsets.only(right: 15)
                        : const EdgeInsets.only(right: 35),
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
                    padding: isMobile
                        ? const EdgeInsets.all(10)
                        : const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 35),
                    margin: isMobile
                        ? const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 0)
                        : const EdgeInsets.only(
                            left: 70, right: 70, top: 50, bottom: 0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 246, 254, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Profile information',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 18 : 24,
                            height: 1.21,
                          ),
                        ),
                        SizedBox(height: isMobile ? 40 : 40),
                        SizedBox(
                          width: isMobile ? double.infinity : 400,
                          child: const Text(
                            'Hi,\nI am contacting you following the charging of my battery which failed due to a bad placement of the battery. I am checking the placement of the battery to avoid wasting time.',
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: isMobile ? 40 : 40),
                        Row(
                          children: [
                            Text(
                              'Fullname: ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                            Text(
                              'Omar Hiopil',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isMobile ? 40 : 40),
                        Row(
                          children: [
                            Text(
                              'Mobile phone: ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '+33 656 64 14 18',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: isMobile ? 14 : 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isMobile ? 40 : 40),
                        Row(
                          children: [
                            Text(
                              'Email: ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                            Text(
                              'email.mail@gmail.fr',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isMobile ? 40 : 40),
                        Row(
                          children: [
                            Text(
                              'Address: ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '23 voie du succès 3000',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: isMobile ? 14 : 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
