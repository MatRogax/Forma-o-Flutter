import 'package:app_imc/app/modules/calculator/widgets/camp_field_widget.dart';
import 'package:app_imc/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _HomePageState();
}

class _HomePageState extends State<CalculatorPage> {
  Color? colorSchema = Colors.white;

  void changeColor(Color colorTochange) {
    setState(() {
      colorSchema = colorTochange;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.assistantColorTheme,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Container(
                color: Constants.primaryColorTheme.withOpacity(0.9),
                width: size.width,
                height: size.height * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Nos conte um pouco sobre você",
                      style: GoogleFonts.poppins(
                        color: Constants.assistantColorTheme,
                      ),
                    ),
                    Text(
                      "Insira seus detalhes abaixo",
                      style: GoogleFonts.roboto(
                        color: Constants.assistantColorTheme,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: size.height * 0.8,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.02),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.04,
                                      right: size.width * 0.04,
                                    ),
                                    child: GestureDetector(
                                      onTap: () => changeColor(Constants.primaryColorTheme),
                                      child: CampField(
                                        width: size.width * 0.5,
                                        child: Text(
                                          "Homem",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.04,
                                      right: size.width * 0.04,
                                    ),
                                    child: GestureDetector(
                                      onTap: () => changeColor(Constants.primaryColorTheme),
                                      child: CampField(
                                        width: size.width * 0.5,
                                        child: Text(
                                          "Mulher",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
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
