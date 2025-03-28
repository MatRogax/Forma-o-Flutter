import 'package:app_imc/app/modules/calculator/widgets/calculator_camp_button_widget.dart';
import 'package:app_imc/app/modules/calculator/widgets/calculator_form_widget.dart';
import 'package:app_imc/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
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
                  padding: EdgeInsets.only(bottom: size.height * 0.095),
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
                  height: size.height * 0.74,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: const SingleChildScrollView(
                      child: WidgetFormCalculator(),
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
