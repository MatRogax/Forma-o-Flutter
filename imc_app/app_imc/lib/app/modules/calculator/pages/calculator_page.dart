import 'package:app_imc/app/modules/calculator/widgets/camp_field_widget.dart';
import 'package:app_imc/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> categoriesPerson = [
    {"Person": "Homem"},
    {"Person": "Mulher"},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  color: Constants.primaryColorTheme.withOpacity(0.9),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Nos conte um pouco sobre você",
                        style: GoogleFonts.poppins(
                          color: Constants.assistantColorTheme,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Insira seus detalhes abaixo",
                        style: GoogleFonts.roboto(
                          color: Constants.assistantColorTheme,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: size.height * 0.7,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.05,
                            width: size.width,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.08,
                                right: size.width * 0.04,
                              ),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categoriesPerson.length,
                                itemBuilder: (context, index) {
                                  bool isSelected = selectedIndex == index;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = isSelected ? -1 : index;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: size.width * 0.02,
                                        right: size.width * 0.02,
                                      ),
                                      child: CardWidget(
                                        decoration: selectedIndex == index
                                            ? BoxDecoration(
                                                color: Constants.primaryColorTheme,
                                                borderRadius: BorderRadius.circular(50),
                                              )
                                            : BoxDecoration(
                                                color: Constants.assistantColorTheme,
                                                borderRadius: BorderRadius.circular(40),
                                              ),
                                        childCard: Center(
                                          child: Text(
                                            categoriesPerson[index]['Person'],
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: selectedIndex == index ? Colors.white : Constants.primaryColorTheme,
                                            ),
                                          ),
                                        ),
                                        size: size,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
