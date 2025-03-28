import 'package:app_imc/app/modules/calculator/widgets/calculator_camp_button_widget.dart';
import 'package:app_imc/app/modules/calculator/widgets/calculator_field_widget.dart';
import 'package:app_imc/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetFormCalculator extends StatefulWidget {
  const WidgetFormCalculator({super.key});

  @override
  State<WidgetFormCalculator> createState() => _WidgetFormCalculatorState();
}

class _WidgetFormCalculatorState extends State<WidgetFormCalculator> {
  double activityLevel = 2;
  int selectedIndexPerson = 0;
  int selectedIndexObjective = 0;

  TextEditingController textAgeController = TextEditingController(text: "");
  TextEditingController textHeightController = TextEditingController(text: "");
  TextEditingController textWeightController = TextEditingController(text: "");
  TextEditingController textTargetWeightController = TextEditingController(text: "");
  TextEditingController textDurationController = TextEditingController(text: "");

  FocusNode focusAge = FocusNode();
  FocusNode focusHeight = FocusNode();
  FocusNode focusWeight = FocusNode();
  FocusNode focusTargetWeight = FocusNode();
  FocusNode focusDuration = FocusNode();

  List<Map<String, dynamic>> categoriesPerson = [
    {"Person": "Homem"},
    {"Person": "Mulher"},
  ];

  List<Map<String, dynamic>> categoriesObjective = [
    {"objective": "Ganhar Peso"},
    {"objective": "Perder Peso"},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.8,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.06,
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
                  bool isSelected = selectedIndexPerson == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexPerson = isSelected ? -1 : index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.004,
                        right: size.width * 0.05,
                      ),
                      child: CardWidget(
                        decoration: selectedIndexPerson == index
                            ? BoxDecoration(
                                color: Constants.primaryColorTheme,
                                borderRadius: BorderRadius.circular(50),
                              )
                            : BoxDecoration(
                                color: Constants.assistantColorTheme,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: Constants.primaryColorTheme, width: 2),
                              ),
                        childCard: Center(
                          child: Text(
                            categoriesPerson[index]['Person'],
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: selectedIndexPerson == index ? Colors.white : Constants.primaryColorTheme,
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
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.02,
              left: size.width * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WidgetCalculatorField(
                  tittle: "Idade",
                  childWidget: TextFormField(
                    controller: textAgeController,
                    maxLength: 2,
                    focusNode: focusAge,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(size.width * 0.025),
                      border: InputBorder.none,
                      labelText: "Ex: 18",
                      labelStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  width: size.width * 0.35,
                  height: size.height * 0.045,
                  size: size,
                ),
                WidgetCalculatorField(
                  tittle: "Altura",
                  childWidget: TextFormField(),
                  width: size.width * 0.35,
                  height: size.height * 0.045,
                  size: size,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.02,
              left: size.width * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WidgetCalculatorField(
                  tittle: "Peso",
                  childWidget: TextFormField(),
                  width: size.width * 0.35,
                  height: size.height * 0.045,
                  size: size,
                ),
                WidgetCalculatorField(
                  tittle: "Peso Desejado",
                  childWidget: TextFormField(),
                  width: size.width * 0.35,
                  height: size.height * 0.045,
                  size: size,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.02,
              left: size.width * 0.08,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WidgetCalculatorField(
                  tittle: "Tempo de Duração",
                  childWidget: TextFormField(
                    onTap: (() {
                      setState(() {});
                    }),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    enabled: true,
                    maxLength: 100,
                    autofocus: false,
                    focusNode: focusDuration,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "Ex: Uma semana",
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        left: size.width * 0.06,
                        bottom: size.height * 0.022,
                      ),
                      suffixIcon: Icon(
                        Icons.app_registration_sharp,
                        color: focusDuration.hasFocus ? Constants.primaryColorTheme : Colors.grey,
                      ),
                      focusedBorder: InputBorder.none,
                    ),
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    controller: textDurationController,
                  ),
                  width: size.width * 0.76,
                  height: size.height * 0.045,
                  size: size,
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.03,
                left: size.width * 0.04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.045),
                    child: const Text(
                      "Activity Level",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.green,
                      inactiveTrackColor: Colors.green.withOpacity(0.2),
                      thumbColor: Colors.green,
                      trackHeight: 6.0,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                      overlayColor: Colors.green.withOpacity(0.2),
                    ),
                    child: Slider(
                      value: activityLevel,
                      min: 1,
                      max: 4,
                      divisions: 3,
                      onChanged: (value) {
                        setState(() {
                          activityLevel = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.045),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("baixo", style: TextStyle(fontSize: 14)),
                        Text("Médio", style: TextStyle(fontSize: 14)),
                        Text("Alto", style: TextStyle(fontSize: 14)),
                        Text("Constante", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.04,
                      left: size.width * 0.04,
                      bottom: size.height * 0.02,
                    ),
                    child: Text(
                      "Objetivo",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    width: size.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.04,
                        right: size.width * 0.04,
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoriesPerson.length,
                        itemBuilder: (context, index) {
                          bool isSelected = selectedIndexObjective == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndexObjective = isSelected ? -1 : index;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.004,
                                right: size.width * 0.05,
                              ),
                              child: CardWidget(
                                decoration: selectedIndexObjective == index
                                    ? BoxDecoration(
                                        color: Constants.primaryColorTheme,
                                        borderRadius: BorderRadius.circular(50),
                                      )
                                    : BoxDecoration(
                                        color: Constants.assistantColorTheme,
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                          color: Constants.primaryColorTheme,
                                          width: 2,
                                        ),
                                      ),
                                childCard: Center(
                                  child: Text(
                                    categoriesObjective[index]['objective'],
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: selectedIndexObjective == index ? Colors.white : Constants.primaryColorTheme,
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
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.025),
            child: SizedBox(
              width: size.width * 0.72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.7,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.primaryColorTheme,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          )),
                      onPressed: () => null,
                      child: Center(
                        child: Text(
                          "Calcular",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
