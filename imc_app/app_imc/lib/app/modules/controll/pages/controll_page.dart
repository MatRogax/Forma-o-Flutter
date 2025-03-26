import 'package:app_imc/app/modules/calculator/pages/calculator_page.dart';
import 'package:app_imc/app/modules/pacients/pages/pacients_page.dart';
import 'package:app_imc/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ControllPage extends StatefulWidget {
  const ControllPage({super.key});

  @override
  State<ControllPage> createState() => _ControllPageState();
}

class _ControllPageState extends State<ControllPage> {
  int currentIndexPage = 0;

  final List<Map<String, dynamic>> pages = [
    {'title': "Vida Sustentável", 'page': const CalculatorPage()},
    {'title': "Vida Sustentável", 'page': const PacientsPage()}
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constants.primaryColorTheme.withOpacity(0.9),
        elevation: 0,
        title: Text(
          pages[currentIndexPage]['title'],
          style: GoogleFonts.aclonica(
            color: Constants.assistantColorTheme,
            fontSize: size.width * 0.067,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: pages[currentIndexPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        backgroundColor: Constants.primaryColorTheme,
        currentIndex: currentIndexPage,
        onTap: (index) {
          setState(() {
            currentIndexPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_sharp),
            label: "Pacientes",
          ),
        ],
      ),
    );
  }
}
